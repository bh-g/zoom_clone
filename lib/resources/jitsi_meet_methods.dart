import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';
import 'package:flutter/material.dart';

class JitsiMeetMethods {
  final serverText = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }

      // Setting up meeting options
      var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        userDisplayName: name,
        userEmail: _authMethods.user.email,
        userAvatarUrl: _authMethods.user.photoURL,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        serverUrl: serverText.text.trim().isEmpty ? null : serverText.text,
        featureFlags: {
          'welcomepage.enabled': false, // Disable the welcome page
          'meeting@room.join': true, // Join without waiting for others
          'meeting@moderator': true, // Make the user the moderator if needed
        },
      );

      // Record meeting in Firestore
      _firestoreMethods.addToMeetingHistory(roomName);

      // Join meeting
      await JitsiMeetWrapper.joinMeeting(
        options: options,
        listener: JitsiMeetingListener(),
      );
    } catch (error) {
      print("Error: $error");
    }
  }
}

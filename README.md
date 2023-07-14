# Proxy Email App

A project containing Login, SignUp, Home screens, Buttons, Textfields and Widgets with attractive UI, input validation, built with Flutter.

## Features

- Signup feature using public domain, valid username
- Login using existing accounts
- View Emails sent to the email account
- View mail details, such as Sender, Subject, Body, Time
- Attractive UI

## Architecture

- Modified Clean Architecture has been followed throughout the project.
- GetX package has been used for state management

## Instructions

Flutter sdk supported version: From 2.16.2, less than 3.0.0

If any model is modified, run on terminal "flutter packages pub run build_runner build --delete-conflicting-outputs" at directory "uniSearch_Test\unisearch_test"

API Documentation: https://docs.mail.tm/

Demo API: https://api.mail.tm/

## Packages and libraries used
  get: ^4.6.5

  shared_preferences: ^2.0.12
  
  cupertino_icons: ^1.0.2
  
  json_annotation: ^4.0.1
  
  json_serializable: ^4.1.1

  flutter_bloc: ^7.3.3
  
  http: ^0.13.4
  
  flutter_easyloading: ^3.0.5
  
  fluttertoast: ^8.0.8
  
  intl: ^0.17.0
  
  flutter_svg: ^1.0.1

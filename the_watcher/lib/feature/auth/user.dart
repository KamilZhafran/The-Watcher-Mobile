import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_watcher/feature/auth/login/login_screen.dart';
import 'package:the_watcher/feature/auth/reset/reset_password.dart';
import 'package:the_watcher/feature/home/home_screen.dart';

import '../../core/constants.dart';

class User {
  final key = GlobalKey<FormState>();
  final nameCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final phoneCtr = TextEditingController();

  final firestore = FirebaseFirestore.instance;

  login(BuildContext context, Function setLoading) {
    FocusManager.instance.primaryFocus?.unfocus();

    if (key.currentState!.validate()) {
      setLoading(true);

      firestore
          .collection(Constants.userRef)
          .where('name', isEqualTo: nameCtr.text)
          .where('password', isEqualTo: passwordCtr.text)
          .get()
          .then((value) {
        setLoading(false);

        if (value.docs.isEmpty) {
          throw Exception('Invalid email / password!');
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => const HomeScreen(),
            ),
          );
        }
      }).catchError((e) {
        setLoading(false);
        Utils.showSnackbar(context, e.toString());
      });
    }
  }

  register(BuildContext context, Function setLoading) {
    FocusManager.instance.primaryFocus?.unfocus();

    if (key.currentState!.validate()) {
      setLoading(true);

      firestore.collection(Constants.userRef).get().then((value) {
        for (var element in value.docs) {
          final data = element.data();

          if (data['email'] == emailCtr.text) {
            throw Exception('Email sudah digunakan!');
          } else if (data['phone'] == phoneCtr.text) {
            throw Exception('Nomor telepon telah digunakan!');
          } else {
            _doRegister(context, setLoading);
          }
        }
      }).catchError((e) {
        setLoading(false);
        Utils.showSnackbar(context, e.toString());
      });
    }
  }

  _doRegister(BuildContext context, Function setLoading) {
    firestore.collection(Constants.userRef).add({
      'name': nameCtr.text,
      'email': emailCtr.text,
      'password': passwordCtr.text,
      'phone': phoneCtr.text
    }).then((value) {
      setLoading(false);

      Navigator.pop(context);
      Utils.showSnackbar(context, 'Registrasi berhasil! silahkan login');
    }).catchError((e) {
      setLoading(false);
      Utils.showSnackbar(context, e.toString());
    });
  }

  forgotPassword(BuildContext context, Function setLoading) {
    FocusManager.instance.primaryFocus?.unfocus();

    if (key.currentState!.validate()) {
      setLoading(true);
      firestore.collection(Constants.userRef).get().then((value) {
        setLoading(false);

        final user = <Map<String, dynamic>>[];

        for (var element in value.docs) {
          final data = element.data();
          data['id'] = element.id;
          log(data.toString());
          if (data['name'] == nameCtr.text && data['email'] == emailCtr.text ||
              data['name'] == nameCtr.text && data['phone'] == emailCtr.text) {
            user.add(data);
          }
        }

        if (user.isEmpty) {
          throw Exception('User tidak ditemukan!');
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => ResetPasswordScreen(userId: user.first['id']),
            ),
          );
        }
      }).catchError((e) {
        setLoading(false);
        Utils.showSnackbar(context, e.toString());
      });
    }
  }

  changePass(BuildContext context, String id, Function setLoading) {
    FocusManager.instance.primaryFocus?.unfocus();

    if (key.currentState!.validate()) {
      setLoading(true);

      firestore
          .collection(Constants.userRef)
          .doc(id)
          .update({'password': nameCtr.text}).then((value) {
        setLoading(false);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => const LoginScreen(),
          ),
        );
        Utils.showSnackbar(context, 'Password telah diubah!');
      }).catchError((e) {
        setLoading(false);
        Utils.showSnackbar(context, e.toString());
      });
    }
  }
}

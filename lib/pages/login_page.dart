import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/pages/home_page.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var emailController = TextEditingController(text: "email@email.com");
  var senhaController = TextEditingController(text: "wolf27");
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                              top: 100, bottom: 12, left: 65, right: 65),
                          child: Image.network(
                              "https://static.wixstatic.com/media/7a378f_5140deabd7d040378d740069cb692b87~mv2.png/v1/crop/x_0,y_10,w_1334,h_493/fill/w_568,h_208,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/logo%20DIO.png")),
                      const Text("Já tem cadastro?",
                          style: TextStyle(fontSize: 26)),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("Faça seu login e make the change._"),
                      ),
                      Container(
                          width: double.infinity,
                          height: 30,
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 4),
                          // alignment: Alignment.center,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 10),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple.shade300)),
                              hintText: "Email",
                              prefixIcon: Icon(Icons.person,
                                  color: Colors.deepPurple.shade300),
                            ),
                          )),
                      Container(
                          width: double.infinity,
                          // hintStyle: TextStyle(color: ),
                          height: 30,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          alignment: Alignment.center,
                          child: TextField(
                            controller: senhaController,
                            obscureText: isObscureText,
                            decoration: InputDecoration(
                              // enabledBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.deepPurple.shade300)
                              // ),
                              contentPadding: const EdgeInsets.only(bottom: 10),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple.shade300)),
                              hintText: "Senha",
                              prefixIcon: Icon(Icons.lock,
                                  color: Colors.deepPurple.shade300),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(
                                    isObscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white),
                              ),
                            ),
                          )),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        child: TextButton(
                            onPressed: () {
                              if (emailController.text.trim() ==
                                      "email@email.com" &&
                                  senhaController.text.trim() == "wolf27") {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const MainPage()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Email ou senha errados!")));
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                Colors.deepPurple.shade300,
                              ),
                            ),
                            child: const Text(
                              "ENTRAR",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Esqueci minha senha",
                              style: TextStyle(color: Colors.yellow)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Criar conta",
                              style: TextStyle(color: Colors.green)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
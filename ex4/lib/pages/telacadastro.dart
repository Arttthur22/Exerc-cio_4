import 'package:flutter/material.dart';
import 'telahome.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  String mensagem = '';
  bool sucesso = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Icon(
                Icons.person_add,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Criar Conta',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Preencha os campos abaixo para criar sua conta.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite seu email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: confirmarSenhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmar Senha',
                  hintText: 'Confirme sua senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                mensagem,
                style: TextStyle(
                  color: sucesso ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  String nome = nomeController.text;
                  String email = emailController.text;
                  String senha = senhaController.text;
                  String confirmarSenha = confirmarSenhaController.text;

                  if (nome.isEmpty) {
                    setState(() {
                      sucesso = false;
                      mensagem = 'Digite seu nome';
                    });
                  } else if (email.isEmpty) {
                    setState(() {
                      sucesso = false;
                      mensagem = 'Digite seu email';
                    });
                  } else if (!email.contains('@')) {
                    setState(() {
                      sucesso = false;
                      mensagem = 'Digite um email válido';
                    });
                  } else if (senha.isEmpty) {
                    setState(() {
                      sucesso = false;
                      mensagem = 'Digite sua senha';
                    });
                  } else if (senha.length < 6) {
                    setState(() {
                      sucesso = false;
                      mensagem = 'A senha precisa ter pelo menos 6 caracteres';
                    });
                  } else if (confirmarSenha != senha) {
                    setState(() {
                      sucesso = false;
                      mensagem = 'As senhas não são iguais';
                    });
                  } else {
                    setState(() {
                      sucesso = true;
                      mensagem = 'Cadastro realizado com sucesso!';
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaHome(),
                        ),
                      );
                    });
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text('Cadastrar'),
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar para Login'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
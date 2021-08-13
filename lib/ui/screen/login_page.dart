part of 'screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userName = TextEditingController();

  final TextEditingController pass = TextEditingController();

  bool isLoading = false;

  static String getIntMonth(DateTime now) {
    return new DateFormat("M").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      subtitle: "Fast Friendly Focus",
      title: "LOGIN",
      child: Container(
        child: Column(
          children: [
            LabelFormRegister(nama: "User Name"),
            FormRegisterFull(nama: "Masukkan User Name", controller: userName),
            LabelFormRegister(nama: "Password"),
            FormRegisterFull(
              nama: "Masukkan Password",
              controller: pass,
              obsecure: true,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 30),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = !isLoading;
                  });
                  await context
                      .read<UserCubit>()
                      .login(userName.text, pass.text);

                  UserState state = context.read<UserCubit>().state;

                  if (state is UserLoaded) {
                    context.read<VisitCubit>().getVisitBySales(state.user.id!);
                    context.read<OutletCubitCubit>().getOutlet(state.user.id!);
                    context.read<NooCubit>().getNooBysales(state.user.id!);
                    context.read<PlanVisitCubit>().getPlanVisit(
                        state.user.id!, getIntMonth(DateTime.now()).toInt());
                  }
                  Get.to(() => MainPage());
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                child: (isLoading)
                    ? loadingIndicator
                    : Text(
                        "LOGIN",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

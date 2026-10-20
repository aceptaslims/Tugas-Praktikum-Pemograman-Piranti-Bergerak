import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _bbController = TextEditingController(); // _ = private
  final _tbController = TextEditingController();

  double? _hasilBMI;
  String _keterangan = "Silakan Masukkan Data Anda!";

  void _hitungBMI(){

    if(jenisKelamin.isEmpty){
      setState(() {
        _hasilBMI = null;
        _keterangan = "Pilih jenis kelamin terlebih dahulu";
      });
      return;
    }

    //?? tenary
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    //setState
    setState(() {
      if (bb > 0 && tbCm > 0) {
        final double tbM = tbCm / 100;
        final double hasil = bb / (tbM * tbM);

        _hasilBMI = hasil;
        String kategori = "";
        if(hasil < 18.5){
          kategori = "kurus";
        }else if(hasil < 25){
          kategori = "ideal";
        }else if(hasil < 30){
          kategori = "Gemuk";
        }else{
          kategori = "Obesitas";
        }

        _keterangan = "$kategori ($jenisKelamin)";

      }else{
        _hasilBMI = null;
        _keterangan = "Masukan data yang valid";
      }
    });
  }
    String jenisKelamin = "";
    void pilihanJenisKelamin(String jenisKelamindiPilih){
      setState(() {
        jenisKelamin = jenisKelamindiPilih;
      });
    }
  void ResetBMI(){
    setState(() {
    _tbController.clear();
    _bbController.clear();
    _hasilBMI = null;
    _keterangan = "Masukan Data Anda";
    
    });
  }

  @override
  void dispose(){ // Membersihkan memori atau cache
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalkulator BMI',
          style: TextStyle(
            fontWeight: .bold,
            color: Colors.white,
            letterSpacing: 5
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.accessibility_rounded, color: Colors.white,), //untuk menambahkan icon
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea( //supaya fleksibel dengan layout hp
        child: SingleChildScrollView( //supaya bisa scroll
        padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      pilihanJenisKelamin("Perempuan");
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: jenisKelamin == "Perempuan" ? Colors.pinkAccent : Colors.transparent, width: 2),
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage('assets/images/ce.jpg'),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10,),
                        Text(
                          'Perempuan',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 24
                          ),
                        )
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      pilihanJenisKelamin("Laki-laki");
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: jenisKelamin == "Laki-laki" ? Colors.blueAccent : Colors.transparent, width: 2),
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage('assets/images/co.jpg'),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10,),
                        Text(
                          'Laki-laki',
                          style:TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 24
                          ),
                        )
                      ],
                    ),
                  ),
                  
                ],
              ),
              TextField(
                controller: _bbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  icon: Icon(Icons.line_weight_outlined, size: 30,),
                  labelText: 'Berat Badan',
                ),
              ),

              SizedBox(height: 15,),
              TextField(
                controller: _tbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  icon: Icon(Icons.height, size: 30,),
                  labelText: 'Tinggi Badan',
                ),
              ),

              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () => _hitungBMI(),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30)
                ),
                child: Icon(Icons.calculate, size: 30,)
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () => ResetBMI(),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30)
                ),
                child: Icon(Icons.delete, size: 30,)
              ),

              SizedBox(height: 15,),
              Text(
                'Hasil : '
              ),

              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey  
                ),
                child: Column(
                  children: [
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? "Nilai Kosong",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: .bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      _keterangan,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
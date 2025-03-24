import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controles de UI de Flutter')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, train }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged:
              (value) => setState(() {
                isDeveloper = !isDeveloper;
              }),
        ),

        ExpansionTile(
          initiallyExpanded: true,
          title: const Text('Vehículo de transporte'),
          subtitle: Text(selectedTransportation.name),
          children: [
            RadioListTile(
              title: const Row(
                children: [
                  Icon(Icons.time_to_leave),
                  SizedBox(width: 10.0),
                  Text('Auto'),
                ],
              ),
              subtitle: const Text('Viajar en auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = value!;
                  }),
            ),
            RadioListTile(
              title: const Row(
                children: [
                  Icon(Icons.flight_outlined),
                  SizedBox(width: 10.0),
                  Text('Avión'),
                ],
              ),
              subtitle: const Text('Viajar en avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = value!;
                  }),
            ),
            RadioListTile(
              title: const Row(
                children: [
                  Icon(Icons.directions_boat_filled),
                  SizedBox(width: 10.0),
                  Text('Barco'),
                ],
              ),
              subtitle: const Text('Viajar en barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = value!;
                  }),
            ),
            RadioListTile(
              title: const Row(
                children: [
                  Icon(Icons.train),
                  SizedBox(width: 10.0),
                  Text('Auto'),
                ],
              ),
              subtitle: const Text('Viajar en tren'),
              value: Transportation.train,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = value!;
                  }),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('Incluir desayuno'),
          value: wantsBreakfast,
          onChanged:
              (value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              }),
        ),
        CheckboxListTile(
          title: const Text('Incluir almuerzo'),
          value: wantsLunch,
          onChanged:
              (value) => setState(() {
                wantsLunch = !wantsLunch;
              }),
        ),
        CheckboxListTile(
          title: const Text('Incluir cena'),
          value: wantsDinner,
          onChanged:
              (value) => setState(() {
                wantsDinner = !wantsDinner;
              }),
        ),
      ],
    );
  }
}

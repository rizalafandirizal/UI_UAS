import 'package:flutter/material.dart';
import '../widgets/material_item_widget.dart';
import 'document_viewer_screen.dart';

class MaterialListScreen extends StatefulWidget {
  const MaterialListScreen({Key? key}) : super(key: key);

  @override
  State<MaterialListScreen> createState() => _MaterialListScreenState();
}

class _MaterialListScreenState extends State<MaterialListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<MaterialItemData> materials = [
    MaterialItemData(
      title: 'Link Materi 1',
      type: MaterialType.link,
      isCompleted: false,
    ),
    MaterialItemData(
      title: 'Pengantar User Interface Design',
      type: MaterialType.document,
      isCompleted: true,
    ),
    MaterialItemData(
      title: 'Video Tutorial UI',
      type: MaterialType.video,
      isCompleted: false,
    ),
  ];

  final List<MaterialItemData> tasks = [
    MaterialItemData(
      title: 'Tugas 1',
      type: MaterialType.document,
      isCompleted: false,
    ),
    MaterialItemData(
      title: 'Kuis 1',
      type: MaterialType.link,
      isCompleted: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pengantar User Interface Design',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Materi ini membahas pengantar desain antarmuka pengguna, mulai dari konsep dasar hingga penerapan praktis dalam pengembangan aplikasi mobile dan web. Peserta akan mempelajari prinsip-prinsip desain UI yang efektif, termasuk penggunaan warna, tipografi, dan layout yang sesuai dengan standar industri. Selain itu, materi ini juga mencakup studi kasus dan praktik langsung untuk memahami bagaimana desain UI yang baik dapat meningkatkan pengalaman pengguna secara keseluruhan.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: 'Lampiran Materi'),
                Tab(text: 'Tugas dan Kuis'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: materials.length,
            itemBuilder: (context, index) {
              final item = materials[index];
              return MaterialItemWidget(
                item: item,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentViewerScreen(),
                    ),
                  );
                },
              );
            },
          ),
          ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return MaterialItemWidget(item: tasks[index]);
            },
          ),
        ],
      ),
    );
  }
}
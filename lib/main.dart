import 'package:flutter/material.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Athira SM · Flutter Developer',
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: C.canvas,
      colorScheme: ColorScheme.fromSeed(seedColor: C.green),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 68,
          height: .98,
          fontWeight: FontWeight.w800,
          letterSpacing: -3.2,
          color: C.ink,
        ),
        displaySmall: TextStyle(
          fontSize: 46,
          height: 1.05,
          fontWeight: FontWeight.w800,
          letterSpacing: -2,
          color: C.ink,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: C.ink,
        ),
        bodyLarge: TextStyle(fontSize: 17, height: 1.7, color: C.muted),
        bodyMedium: TextStyle(fontSize: 15, height: 1.55, color: C.muted),
      ),
    ),
    home: const PortfolioPage(),
  );
}

class C {
  static const canvas = Color(0xFFF6F4EF),
      paper = Color(0xFFFFFDF8),
      ink = Color(0xFF14231C);
  static const muted = Color(0xFF647069),
      green = Color(0xFF174C3B),
      lime = Color(0xFFD8F36A);
  static const orange = Color(0xFFF37A52),
      lilac = Color(0xFFD9D2FF),
      line = Color(0xFFDDE1DB);
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final home = GlobalKey(),
      work = GlobalKey(),
      about = GlobalKey(),
      contact = GlobalKey();
  Future<void> go(GlobalKey key) async {
    final target = key.currentContext;
    if (target != null) {
      await Scrollable.ensureVisible(
        target,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
        alignment: .04,
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: C.canvas.withValues(alpha: .95),
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 76,
      titleSpacing: 0,
      title: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LayoutBuilder(
              builder: (context, constraints) => Row(
                children: [
                  InkWell(
                    onTap: () => go(home),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'ATHIRA / SM',
                        style: TextStyle(
                          color: C.ink,
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (constraints.maxWidth >= 680) ...[
                    Nav('Work', () => go(work)),
                    Nav('About', () => go(about)),
                    Nav('Experience', () => go(about)),
                    const SizedBox(width: 12),
                  ],
                  if (constraints.maxWidth < 400)
                    IconButton.filled(
                      onPressed: () => go(contact),
                      tooltip: 'Contact',
                      style: IconButton.styleFrom(backgroundColor: C.ink),
                      icon: const Icon(Icons.arrow_outward_rounded),
                    )
                  else
                    FilledButton(
                      onPressed: () => go(contact),
                      style: FilledButton.styleFrom(
                        backgroundColor: C.ink,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 17,
                        ),
                      ),
                      child: const Text('Let’s talk'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    body: SelectionArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(key: home, onWork: () => go(work)),
            SelectedWork(key: work),
            About(key: about),
            const Archive(),
            Contact(key: contact),
            const Footer(),
          ],
        ),
      ),
    ),
  );
}

class Nav extends StatelessWidget {
  const Nav(this.label, this.tap, {super.key});
  final String label;
  final VoidCallback tap;
  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: tap,
    style: TextButton.styleFrom(
      foregroundColor: C.ink,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    ),
    child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
  );
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onWork});
  final VoidCallback onWork;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final small = constraints.maxWidth < 800;
      final headline = Text(
        'I build mobile\nexperiences that\nfeel effortless.',
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: small ? 47 : 68,
          letterSpacing: small ? -2.2 : -3.2,
        ),
      );
      final introduction = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Flutter developer with 4 years of experience turning complex product ideas into clean, responsive and reliable apps.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton.icon(
                onPressed: onWork,
                icon: const Icon(Icons.south_east_rounded, size: 18),
                label: const Text('Explore my work'),
                style: FilledButton.styleFrom(
                  backgroundColor: C.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 18,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: C.line),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(radius: 4, backgroundColor: Color(0xFF54A96B)),
                    SizedBox(width: 9),
                    Text(
                      'Open to opportunities',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
      return Section(
        padding: EdgeInsets.fromLTRB(24, small ? 70 : 110, 24, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Eyebrow('FLUTTER DEVELOPER · KERALA, INDIA'),
            const SizedBox(height: 28),
            if (small)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [headline, const SizedBox(height: 34), introduction],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 7, child: headline),
                  const SizedBox(width: 70),
                  Expanded(flex: 4, child: introduction),
                ],
              ),
            const SizedBox(height: 78),
            const Metrics(),
          ],
        ),
      );
    },
  );
}

class Metrics extends StatelessWidget {
  const Metrics({super.key});
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: C.paper,
      border: Border.all(color: C.line),
      borderRadius: BorderRadius.circular(20),
    ),
    child: LayoutBuilder(
      builder: (_, box) {
        final vertical = box.maxWidth < 650;
        const data = [
          ('4+', 'Years building Flutter apps'),
          ('8', 'Products across industries'),
          ('2', 'Languages with RTL support'),
        ];
        return Flex(
          direction: vertical ? Axis.vertical : Axis.horizontal,
          children: data
              .map(
                (x) => Expanded(
                  flex: vertical ? 0 : 1,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(26),
                    decoration: BoxDecoration(
                      border: vertical
                          ? const Border(bottom: BorderSide(color: C.line))
                          : null,
                    ),
                    child: Row(
                      children: [
                        Text(
                          x.$1,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: C.green,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Flexible(child: Text(x.$2)),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    ),
  );
}

class SelectedWork extends StatelessWidget {
  const SelectedWork({super.key});
  @override
  Widget build(BuildContext context) => Container(
    color: C.ink,
    width: double.infinity,
    child: Section(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Eyebrow('SELECTED WORK', light: true),
          const SizedBox(height: 18),
          Text(
            'Products made with purpose.',
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 18),
          Text(
            'From personalised customer experiences to social platforms and field-service tools.',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.white60),
          ),
          const SizedBox(height: 54),
          const ProjectCard(
            number: '01',
            title: 'Cortado Café',
            category: 'MOBILE ORDERING · AI PERSONALISATION',
            description:
                'A seamless coffee experience for dine-in, takeaway, delivery and car pickup. The app learns each customer’s taste and keeps their favourite coffee one tap away.',
            tags: ['Flutter', 'BLoC', 'REST APIs', 'Firebase'],
            image: 'assets/images/cortado_cafe.png',
            accent: C.orange,
          ),
          const SizedBox(height: 28),
          const ProjectCard(
            number: '02',
            title: 'NAD Rewards',
            category: 'LOYALTY · WALLET · MEMBER OFFERS',
            description:
                'A rewards experience that helps customers earn points, discover exclusive offers, top up their wallet and redeem benefits from favourite brands.',
            tags: ['Flutter', 'Wallet', 'Rewards', 'Payments'],
            image: 'assets/images/nad_rewards.png',
            accent: C.lilac,
          ),
          const SizedBox(height: 28),
          const ProjectCard(
            number: '03',
            title: 'Cortado Kiosk',
            category: 'SELF-SERVICE · RESPONSIVE KIOSK',
            description:
                'A cross-platform ordering kiosk built from scratch for mobile, tablet and large displays—with product customisation, OTP, loyalty points and secure multi-method payments.',
            tags: ['Flutter', 'BLoC / Cubit', 'RTL', 'WebView'],
            image: 'assets/images/cortado_kiosk.png',
            accent: Color(0xFF202526),
            imageFit: BoxFit.contain,
          ),
          const SizedBox(height: 28),
          const ProjectCard(
            number: '04',
            title: 'Trings',
            category: 'SOCIAL PLATFORM · LIVE EXPERIENCES',
            description:
                'A social platform for rich feeds, live streaming, communities and real-time conversations—built around authentic connection and discovery.',
            tags: [
              'Flutter',
              'Clean Architecture',
              'BLoC',
              'Zego',
              'CometChat',
            ],
            image: 'assets/images/trings.png',
            accent: Color(0xFFFF746B),
            imageFit: BoxFit.contain,
          ),
          const SizedBox(height: 28),
          const ProjectCard(
            number: '05',
            title: 'D-Global',
            category: 'FIELD SERVICE · OPERATIONS',
            description:
                'A technician and operations app that streamlines service requests, job cards, employee attendance and operational reporting.',
            tags: ['Flutter', 'Provider', 'Signatures', 'PDF Workflows'],
            image: 'assets/images/d_global.png',
            accent: Color(0xFF35A5DF),
            imageFit: BoxFit.contain,
          ),
        ],
      ),
    ),
  );
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.tags,
    required this.accent,
    this.image,
    this.imageFit = BoxFit.cover,
  });
  final String number, title, category, description;
  final List<String> tags;
  final Color accent;
  final String? image;
  final BoxFit imageFit;
  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hover = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => hover = true),
    onExit: (_) => setState(() => hover = false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      transform: Matrix4.translationValues(0, hover ? -5 : 0, 0),
      decoration: BoxDecoration(
        color: C.paper,
        borderRadius: BorderRadius.circular(28),
        boxShadow: hover
            ? const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 28,
                  offset: Offset(0, 14),
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(
        builder: (_, box) {
          final stacked = box.maxWidth < 780;
          final copy = Padding(
            padding: EdgeInsets.all(stacked ? 28 : 44),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      widget.number,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.category,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                          color: C.muted,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 18),
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 26),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.tags.map((x) => Tag(x)).toList(),
                ),
              ],
            ),
          );
          final art = Container(
            color: widget.accent,
            padding: const EdgeInsets.all(22),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(widget.image!, fit: widget.imageFit),
            ),
          );
          if (stacked) {
            return Column(
              children: [
                SizedBox(height: 310, width: double.infinity, child: art),
                copy,
              ],
            );
          }
          return SizedBox(
            height: 560,
            child: Row(
              children: [
                Expanded(flex: 5, child: copy),
                Expanded(flex: 6, child: art),
              ],
            ),
          );
        },
      ),
    ),
  );
}

class Tag extends StatelessWidget {
  const Tag(this.label, {super.key});
  final String label;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: C.canvas,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: C.line),
    ),
    child: Text(
      label,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    ),
  );
}

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) => Section(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 105),
    child: LayoutBuilder(
      builder: (_, box) {
        final stacked = box.maxWidth < 820;
        final bio = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Eyebrow('ABOUT ME'),
            const SizedBox(height: 22),
            Text(
              'Thoughtful code.\nUseful products.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 26),
            Text(
              'I’m Athira, a Flutter developer who cares about architecture as much as the final interaction. I build readable, testable applications and collaborate closely with product, design and backend teams to ship work that lasts.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            const Wrap(
              spacing: 9,
              runSpacing: 9,
              children: [
                Skill('Dart'),
                Skill('Flutter'),
                Skill('BLoC'),
                Skill('Provider'),
                Skill('GetX'),
                Skill('REST APIs'),
                Skill('Firebase'),
                Skill('Clean Architecture'),
                Skill('Hive DB'),
                Skill('Figma'),
                Skill('Git'),
              ],
            ),
          ],
        );
        final exp = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Eyebrow('EXPERIENCE'),
            const SizedBox(height: 28),
            const Experience(
              'Flutter Developer',
              'Webtree Software Solution · Mangalore',
              'JAN 2024 — PRESENT',
            ),
            const Experience(
              'Flutter Developer',
              'Nintriva · Kochi',
              'MAY 2021 — NOV 2023',
            ),
            const Experience(
              'Junior Software Engineer',
              'Websoullabs · Kochi',
              'SEP 2020 — FEB 2021',
            ),
            const SizedBox(height: 22),
            const Eyebrow('EDUCATION'),
            const SizedBox(height: 24),
            const Text(
              'M.Voc · Mobile Phone Application Development',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const Text(
              'CUSAT, Kochi · 2018—2020',
              style: TextStyle(color: C.muted),
            ),
            const SizedBox(height: 16),
            const Text(
              'B.Voc · Software Development',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const Text(
              'Carmel College, Mala · 2015—2018',
              style: TextStyle(color: C.muted),
            ),
          ],
        );
        return stacked
            ? Column(children: [bio, const SizedBox(height: 70), exp])
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: bio),
                  const SizedBox(width: 100),
                  Expanded(child: exp),
                ],
              );
      },
    ),
  );
}

class Skill extends StatelessWidget {
  const Skill(this.label, {super.key});
  final String label;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: BoxDecoration(
      color: C.paper,
      border: Border.all(color: C.line),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      label,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
    ),
  );
}

class Experience extends StatelessWidget {
  const Experience(this.role, this.company, this.period, {super.key});
  final String role, company, period;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(bottom: 23, top: 4),
    margin: const EdgeInsets.only(bottom: 20),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: C.line)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          period,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
            color: C.green,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          role,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 4),
        Text(company, style: const TextStyle(color: C.muted)),
      ],
    ),
  );
}

class Archive extends StatelessWidget {
  const Archive({super.key});
  @override
  Widget build(BuildContext context) {
    const projects = [
      (
        'Bin Faqeeh',
        'Real estate',
        'Property discovery · Multimedia · Play Store',
      ),
      (
        'Just Borrow',
        'Rental marketplace',
        'REST APIs · Availability · Reminders',
      ),
      ('Toffee Ride', 'EdTech', '1100+ lessons · Hive · Firebase · AWS'),
    ];
    return Container(
      color: C.paper,
      width: double.infinity,
      child: Section(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Eyebrow('MORE PROJECTS'),
            const SizedBox(height: 20),
            Text(
              'A wider body of work.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 45),
            ...projects.asMap().entries.map(
              (e) => Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: C.line)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 46,
                      child: Text(
                        '0${e.key + 6}',
                        style: const TextStyle(color: C.muted),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        e.value.$1,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    if (MediaQuery.sizeOf(context).width > 620)
                      Expanded(
                        child: Text(
                          e.value.$2,
                          style: const TextStyle(color: C.muted),
                        ),
                      ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        e.value.$3,
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 13, color: C.muted),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({super.key});
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    color: C.lime,
    child: Section(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 90),
      child: LayoutBuilder(
        builder: (_, box) {
          final compact = box.maxWidth < 760;
          final details = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ContactLine('EMAIL', 'athirameethu23@gmail.com'),
              SizedBox(height: 24),
              ContactLine('PHONE', '+91 70126 69720'),
              SizedBox(height: 24),
              ContactLine('GITHUB', 'github.com/Athira-Murali'),
            ],
          );
          return Flex(
            direction: compact ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: compact ? 0 : 3,
                child: Text(
                  'Have a product in mind?\nLet’s build it well.',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SizedBox(width: compact ? 0 : 70, height: compact ? 36 : 0),
              Expanded(flex: compact ? 0 : 2, child: details),
            ],
          );
        },
      ),
    ),
  );
}

class ContactLine extends StatelessWidget {
  const ContactLine(this.label, this.value, {super.key});
  final String label, value;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
        ),
      ),
      const SizedBox(height: 8),
      SelectableText(
        value,
        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
      ),
    ],
  );
}

class Footer extends StatelessWidget {
  const Footer({super.key});
  @override
  Widget build(BuildContext context) => Container(
    color: C.ink,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: LayoutBuilder(
          builder: (context, constraints) => Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 8,
            spacing: 24,
            children: const [
              Text(
                'ATHIRA SM',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Built with Flutter · 2026',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class Eyebrow extends StatelessWidget {
  const Eyebrow(this.label, {super.key, this.light = false});
  final String label;
  final bool light;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(width: 24, height: 2, color: light ? C.lime : C.orange),
      const SizedBox(width: 10),
      Flexible(
        child: Text(
          label,
          style: TextStyle(
            color: light ? Colors.white70 : C.green,
            fontSize: 11,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
      ),
    ],
  );
}

class Section extends StatelessWidget {
  const Section({super.key, required this.child, required this.padding});
  final Widget child;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1228),
      child: Padding(padding: padding, child: child),
    ),
  );
}

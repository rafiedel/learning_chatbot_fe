part of '_widgets.dart';

class SymbolSheete extends StatefulWidget {
  const SymbolSheete({super.key, required this.initial});
  final String initial;

  @override
  State<SymbolSheete> createState() => SymbolSheeteState();
}

class SymbolSheeteState extends State<SymbolSheete> {
  late final TextEditingController _sheetCtrl;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _sheetCtrl = TextEditingController(text: widget.initial);
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _sheetCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /* insert glyph at caret */
  void _insert(String g) {
    final sel = _sheetCtrl.selection;
    _sheetCtrl.text =
        _sheetCtrl.text.replaceRange(sel.start, sel.end, g);
    _sheetCtrl.selection =
        TextSelection.collapsed(offset: sel.start + g.length);
    setState(() {}); // refresh preview if you add one later
  }

  void _close() => Navigator.pop(context, _sheetCtrl.text);

  // full catalogue (same order as screenshots)
  static const Map<String, List<String>> _symbols = {
    'Simbol: Matematika': [
      '²','³','√','∛','·','×','÷','±','≈','≠','≤','≥','≡','≅','⇒',',','⇔','∈','∉','∧',
      '∨','∞','α','β','Δ','π','Φ','ω','↑','↓','∴','∵','↔','→','←','⇕','⇑','⇓','↠','↞',
      '∫','∑','⊂','⊃','⊆','⊇','¢','∤','∀','°','∠','∡','⊥','∪','∩','∅','¬','⊕','∥','║'
    ],
    'Simbol: Superskrip dan subskrip': [
      '¹','²','³','⁴','⁵','⁶','⁷','⁸','⁹','⁰','⁺','⁻','⁽','⁾','ᵃ','ᵇ','ⁿ','ˣ',
      '₁','₂','₃','₄','₅','₆','₇','₈','₉','₀','₊','₋','₍','₎','ₐ','ₑ','ₙ','ₓ'
    ],
    'Simbol Bahasa: Sirilik': [
      'А','Б','В','Г','Д','Е','Ж','З','Ё','И','Й','К','Л','М','Н','О','П','Р','С',
      'Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я',
      'а','б','в','г','д','е','ж','з','ё','и','й','к','л','м','н','о','п','р','с',
      'т','у','ф','х','ц','ч','ш','щ','ъ','ы','ь','э','ю','я'
    ],
    'Simbol Bahasa: Yunani': [
      'Α','Β','Γ','Δ','Ε','Ζ','Η','Θ','Ι','Κ','Λ','Μ','Ν','Ξ','Ο','Π','Ρ','Σ','Τ',
      'Υ','Φ','Χ','Ψ','Ω',
      'α','β','γ','δ','ε','ζ','η','θ','ι','κ','λ','μ','ν','ξ','ο','π','ρ','ς','σ','τ',
      'υ','φ','χ','ψ','ω'
    ],
    'Simbol Bahasa: Eropa': [
      'À','Â','Ç','É','È','Î','Ï','Ô','Û','Ÿ','Œ','Æ','ß','Ä','Ö','Ü',
      'à','â','ç','é','è','ê','î','ï','ô','û','ù','ÿ','œ','æ','ä','ö','ü'
    ],
    'Simbol lain': [
      '€','£','¥','₹','¢','®','™','‰','℅'
    ],
  };

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.of(context).viewInsets; // respect OS keyboard
    return Material(
      color: const Color(0xFF1C1C1C),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 12, 16, insets.bottom + 12),
        child: Column(
          children: [
            // read-only TextField (no phone keyboard)
            Scrollbar(
              child: TextField(
                controller: _sheetCtrl,
                focusNode: _focusNode,        // <--- This makes it "focused"
                readOnly: true,               // Can't edit
                showCursor: true,             // Cursor visible
                enableInteractiveSelection: true,
                minLines: 2,
                maxLines: 4,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Enter text...',
                ),
              ),
            ),
            const SizedBox(height: 12),

            // symbol palette (scrollable)
            Expanded(
              child: ListView(
                children: _symbols.entries.map((e) => ExpansionTile(
                  tilePadding: EdgeInsets.all(0),
                  initiallyExpanded: e.key == 'Simbol: Matematika',
                  title: Text(e.key,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: e.value.map((g) => InkWell(
                          onTap: () => _insert(g),
                          child: Text(g, style: const TextStyle(fontSize: 22)),
                        )).toList(),
                      ),
                    ),
                  ],
                )).toList(),
              ),
            ),

            
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    vertical: 18, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.deepPurple),
                  ),
                  elevation: 4,
                ),
                onPressed: _close,
                icon: const Icon(Icons.close),
                label: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
fun main() {
    // すべての同じ1000
    val a = 1000
    val b = 1_000
    val c = 0x3E8
    println(a)
    println(b)
    println(c)

    // 型表示（型サフィックス）
    val a = 10L
    val b = 10F
    println(a::class)
    println(b::class)

    // 文字列リテラル
    val msg1 = "こんにちは。\n私はkotlinを学んでいます。"
    val msg2 = """こんにちは
			    |私はkotlinを学んでいます。""".trimMargin() //行頭を揃えるメソッド
    println(msg1)
    println(msg2)

    // 文字列テンプレート
    val data = arrayOf(1, 2, 3)
    println("配列dataの先頭の値は${data[0]}で、要素数は${data.size}です。")
    println("1+1は、${1+1}です")

    // Nullable型
    val a1: String? = "foo"
    println(a1?.length)

    val a2: String? = null
    println(a2?.length)

    val a3: String? = null
    println(a3?.length ?: 0)

    val a4: String? = "foo2"
    // Nullable型を強制的に非null型変換（Nullじゃないことがわかっていることが前提）
    println(a4!!.length)

}

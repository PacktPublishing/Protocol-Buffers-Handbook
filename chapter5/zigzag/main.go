package main

import (
	"fmt"
	"os"
	"text/tabwriter"
	"unsafe"
)

type encodable interface {
	int | int32 | int64
}

func zigZagEncode[E encodable](e E) E {
	return (e << 1) ^ (e >> (unsafe.Sizeof(e)*8 - 1))
}

func zigZagDecode[E encodable](e E) E {
	return (e >> 1) ^ (-(e & 1))
}

func main() {
	w := tabwriter.NewWriter(os.Stdout, 0, 0, 1, ' ', tabwriter.TabIndent)

	fmt.Fprintln(w, "original\tencoded")
	for i := -20; i <= 20; i++ {
		fmt.Fprintf(w, "%d\t%d\n", i, zigZagEncode(i))
	}
	w.Flush()
}

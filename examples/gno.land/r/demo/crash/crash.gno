package crash

import (
    "strconv"

    "gno.land/p/mason/md"
    "gno.land/p/moul/txlink"
)

type myInt struct {
    num int
}

type stringMap map[myInt]int

var (
    accounts      = stringMap{}
    nextAccountId = myInt{0}
)

func Register() {
    crossing()

    nextAccountId.num += 1
    accounts[nextAccountId] = nextAccountId.num
}

func Render(string) string {
    return strconv.Itoa(len(accounts)) + "\n\n" + md.Link("reg", txlink.Call("Register"))
}
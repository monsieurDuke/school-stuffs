package main
import (
	"fmt"
	"strconv"
	"time"
)

var a string = "Quick Math\n--"
var i int = 10; var j int = 20; var k float32 = 2.20
var check_even bool
var name string
var datebirth int
var curyear int = time.Now().Year()
var grade int
var grade_char string
var factornum int
var arr_num [3] int

func basic_concepts() {
	// basic-math
	x := i + j
	y := float32(x) + k
	fmt.Println(a)
	fmt.Println(i," + ",j,"\t= ",x)
	fmt.Println(x," + ",k,"\t= ",y,"\n--")

	// odd-even check
	if (int(y)%2) == 0 { fmt.Println(y," is even"); check_even = true;
	} else { fmt.Println(y," is odd") }
	fmt.Println(check_even)
	fmt.Println("My age is " + strconv.Itoa(j+i) + "\n--")

	if z := curyear-j; (z > 1999) {fmt.Println("Millenial in",z)
	} else { fmt.Println("Oldman in ",z) }

	// relational operator = boolean
	// logical operator = 2 condition of relational operator
	fmt.Println(j > i)
	fmt.Println((((j%2)==0) || ((i%2)==0)),"\n--")

	// user input
	fmt.Print("Enter your name: "); fmt.Scanln(&name)
	fmt.Print("Enter your birth year: "); fmt.Scanln(&datebirth)
	fmt.Println("Hi " + name + ", you are " + strconv.Itoa(curyear - datebirth) + " years old\n--")

	// switch case, bottom-up 
	fmt.Print("Enter your grade: "); fmt.Scanln(&grade)
	switch {
	case grade>0 && grade<=60:
		grade_char = "C"
	case (grade>60) && (grade<=80):
		grade_char = "B"
	default:
		grade_char = "A"
	}
	fmt.Println("Your grade is " + grade_char + "\n--")

	// looping factorial
	fmt.Print("Enter a number: "); fmt.Scanln(&factornum)	
	ctr := 0
	for i:=1; i<=factornum; i++ {
		if ((factornum%i) == 0) {
			fmt.Print(i," ")
			ctr++
		}
	}
	fmt.Println("\nTotal factorial: ",ctr,"\n--")
}
func functions(name string, year int) (string, int) {
	alias := name[(len(name)-4):len(name)]
	text := "My name is " + name + ", but you can call me " + alias
	age := time.Now().Year() - year
	return text, age
}
func functions2() {
	fmt.Println("--\nreleasing all connections")
}

func mars_age(age int) int {
	post_age := (age*365)/687
	return post_age
}

func pointer() (*int, int){
	x := 42
	p := &x
	*p = *p-10
	return p,x
}

type data_dic struct {
	nama_jurusan string
	nama string
	umur int
	menikah bool
}
func (x data_dic) getyear() int { // kalkulasi isi struct
	year := time.Now().Year()
	return year - x.umur
}

func (x *data_dic) addage(add int) { // ubah isi struct, harus lewat memory
	x.umur += add
}

type Timer struct {
	id string
	value int
}

func (x *Timer) tick() {
	x.value ++
	fmt.Println(x.value)
}

func avg(nums ...float32) {
	total := float32(0)
	for _,v := range nums {
		total += float32(v)
	}
	avg := total / float32(len(nums))
	fmt.Println(avg)
}

func out(from int, to int, ch chan bool) {
	for i:=from; i<=to; i++ {
		time.Sleep(50 * time.Millisecond)
		fmt.Println(i)
	}
	ch <- true
}
func calcFactorial(num int, ch chan int) {
	result := 0
	for i:=1; i<=num; i++ {
		if num%i == 0 {
			fmt.Println(num,":",i)
			result ++
		}
	}
	ch <- result
}

func download(packet int, ch chan int) {
	final_packet := 0
	for i:=0; i<=packet; i++ {
		final_packet += i
	}
	ch <- final_packet
}

func main() {

	// basic_concepts()
	// defer functions2() // exec after the main one is finished
	// get_text, get_age := functions("Khannedy",1999)
	// fmt.Println(get_text)
	// fmt.Println("Im currently " + strconv.Itoa(get_age) + " years old")
	// mars := mars_age(42)
	// fmt.Println(mars)
	// p,x := pointer()
	// fmt.Println(p)
	// fmt.Println(&x)

	// x := data_dic{"TIK","Muhammad Nur Irsyad",21,true}
	// y := &x
	// z := &data_dic{"SOS","Muhammad Anshori",22,false}
	// fmt.Println("Nama:",x.nama," (",x.nama_jurusan,")\nUmur:",x.umur,"\nMenikah:",x.menikah,"\n--")
	// fmt.Println("Nama:",y.nama," (",y.nama_jurusan,")\nUmur:",y.umur,"\nMenikah:",y.menikah,"\n--")
	// fmt.Println("Nama:",z.nama," (",z.nama_jurusan,")\nUmur:",z.umur,"\nMenikah:",z.menikah,"\n--")	
	// tahun_lahir := x.getyear()
	// x.addage(5)
	// fmt.Println("Tahun lahir:",tahun_lahir,"\nUmur Baru:",x.umur)

	// var x int
	// fmt.Scanln(&x)
	// t := Timer{"timer1",0}
	// for i:=0; i<x; i++ {
	// 	t.tick()
	// }
	
	// arr_inst := [5]string {"a","b","c","d","e"} // deklarasi scope local function
	// fmt.Println(arr_inst[0]) // access
	// arr_inst[0] = "z" // assign
	// slice_arr := arr_inst[:3] // slices
	// fmt.Println(slice_arr)
	// a := make([]float32, 0) // creating dynamic slices, initialize with 0
	// a = append(a,10,22,13,54,55) // appending elements to the dynamic slices
	// fmt.Println(a)
	// a = append(a,61,79)
	// fmt.Println(a)	

	// for idx,val := range a { // looping trough array / slice / map with range
	// 	fmt.Println(idx," > ",val) // returns index and the value
	// }

	// cc := "irsyad"
	// for idx,val := range cc { // looping trough string with range
	// 	fmt.Printf("%c ",val) // returns value as unicode, convert it
	// 	if idx+1 == len(cc) { // make counter to start from 1
	// 		fmt.Println("")
	// 	}
	// }

	// map_umur := make(map[string]int) // making an dictionary / hash tables 
	// map_umur["irsyad"] = 21
	// map_umur["icang"] = 27
	// map_umur["iam"] = 23

	// map_umur2 := map[string]int {
	// 	"irsyad": 21,
	// 	"icang": 27,
	// 	"iam": 23 }

	// fmt.Println(map_umur["irsyad"])
	// fmt.Println(map_umur2["irsyad"])

	// delete(map_umur,"irsyad")
	// fmt.Println(map_umur["irsyad"])

	// tinggi_badan := map[string]float32 {
	// "irsyad": 180.0,
	// "icang": 175.0,
	// "iam": 172.0,
	// "papah": 168,
	// "mamah": 153 }

	// sum_tinggi := float32(0)
	// val_max_tinggi := float32(0)
	// key_max_tinggi := ""

	// for key,val := range tinggi_badan {
	// 	sum_tinggi += val
	// 	if val_max_tinggi < val {
	// 		val_max_tinggi = val
	// 		key_max_tinggi = key
	// 	}
	// }

	// rata_tinggi := sum_tinggi / float32(len(tinggi_badan))
	// fmt.Println("rata-rata tinggi badan adalah ",rata_tinggi)
	// fmt.Println("yang tertinggi adalah ",key_max_tinggi," dengan ",tinggi_badan[key_max_tinggi])

	// b := [3]float32 {3,1,2}
	// c := b[:len(b)]

	// avg(180,175,172,168,153) // variadic with argument
	// avg(a...) // variadic with slice, cannot be array	
	// avg(c...) // variadic with slice, cannot be array

    // results := []string{"w", "l", "w", "d", "w", "l", "l", "l", "d", "d", "w", "l", "w", "d"}
    // last_match := ""
    // fmt.Scanln(&last_match)
    // results = append(results,last_match)
    // sum_score := 0
    // for _,x := range results {
    // 	switch {
    // 	case x == "w":
    // 		sum_score += 3
    // 	case x == "d":
    // 		sum_score += 1    		
    // 	default:
    // 		sum_score += 0    		
    // 	}
    // }
    // fmt.Println(sum_score)

    // ch1 := make(chan int)
    // ch2 := make(chan int)

    // go calcFactorial(140, ch1)
    // go calcFactorial(1100, ch2)

    // select {
	   //  case x:= <-ch1:
	   //  	fmt.Println(x)
	   //  case y:= <-ch2:
	   //  	fmt.Println(y)
    // }

    ch1 := make(chan int)
    ch2 := make(chan int)
    ch3 := make(chan int)

    var s1, s2, s3 int
    fmt.Scanln(&s1)
    fmt.Scanln(&s2)
    fmt.Scanln(&s3)

    go download(s1, ch1)
    go download(s2, ch2)
    go download(s3, ch3)

    fmt.Println((<-ch1 + <-ch2 + <-ch3))

}

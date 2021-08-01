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

	var x int
	fmt.Scanln(&x)
	t := Timer{"timer1",0}
	for i:=0; i<x; i++ {
		t.tick()
	}
}

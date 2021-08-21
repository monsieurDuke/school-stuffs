package main

import (
    "log"
    "net/http"
    "cookie/source/golang"
)
// main function
func main() {    
    url := "http://localhost:8080"    
    mux := http.NewServeMux()    
    log.Println("[gfarms]: starting server on",url)
    //    
    mux.Handle("/asset/", http.StripPrefix("/asset/", http.FileServer(http.Dir("asset"))))
    mux.Handle("/source/css/", http.StripPrefix("/source/css/", http.FileServer(http.Dir("source/css"))))
    mux.Handle("/source/js/", http.StripPrefix("/source/js/", http.FileServer(http.Dir("source/js"))))        
    //    
    mux.HandleFunc("/",golang.HomePage)    
    mux.HandleFunc("/tutorial",golang.TutorialPage)
    mux.HandleFunc("/article",golang.ArticlePage)    
    mux.HandleFunc("/publication",golang.PublicationPage)    
    //
    err := http.ListenAndServe(":8080",mux)
    log.Fatal(err)
}
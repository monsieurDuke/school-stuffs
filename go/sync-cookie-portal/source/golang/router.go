package golang

import (
    "log"
    "net/http"
    "path"
    "strconv"    
    "html/template"
)
var url string = "http://localhost:8080"

// page router
func HomePage(w http.ResponseWriter, r *http.Request) {
    if r.URL.Path != "/" {
        http.NotFound(w,r)
        log.Println("[gfarms]: req HTTP/404 page not found",r.URL.Path,"|",r.RemoteAddr)
        return
    }

    tmp,err := template.ParseFiles(path.Join("pages","index.html"))
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        log.Println("[gfarms]: req HTTP/"+strconv.Itoa(http.StatusInternalServerError),err,"|",r.RemoteAddr)
        return        
    }
    err = tmp.Execute(w,nil)
    if err != nil {
        log.Println("[gfarms]: req HTTP/"+strconv.Itoa(http.StatusInternalServerError),err,"|",r.RemoteAddr)        
        return
    }    
    log.Println("[gfarms]: req HTTP/1.1 "+url+"/","|",r.RemoteAddr)
}

func DboardPage(w http.ResponseWriter, r *http.Request) {
    tmp,err := template.ParseFiles(path.Join("pages","dashboard.html"))
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        log.Println("[gfarms]: req HTTP/"+strconv.Itoa(http.StatusInternalServerError),err,"|",r.RemoteAddr)
        return        
    }
    err = tmp.Execute(w,nil)
    if err != nil {
        log.Println("[gfarms]: req HTTP/"+strconv.Itoa(http.StatusInternalServerError),err,"|",r.RemoteAddr)        
        return
    }    
    log.Println("[gfarms]: req HTTP/1.1 "+url+"/dashboard","|",r.RemoteAddr)
}
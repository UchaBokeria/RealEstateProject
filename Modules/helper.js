
export default class Helper {

    getJsonFile = async (url) => {
        const data = new Promise((resolve, reject) => {
            fetch(url)
                .then(respond => {
                    resolve(respond.json())
                }).catch(err => {
                    reject(err)
                })
        });
        
        return await data;
    }
    
    getFromFile = async (url) => {
        const  response = await fetch(url)
        const  text = await response.text();
        return text;
    }
    
    UrlExists = async (url) => {
        // checks if file exists
        var http = new XMLHttpRequest();
        http.open('HEAD', url, false);
        http.send();
        return await http.status!=404;
    }
}
@isTest
global class ApiCalloutMock implements HttpCalloutMock{
    global HttpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type','application/json');
        res.setBody('{"color": "random color: #23ABC0","colorCode": "#23ABC0","colorDate": "2022-05-26T00:32:59.856Z"}');
        res.setStatusCode(200);
        return res;
    }
}
@isTest
global class ApiCalloutMock implements HttpCalloutMock{
    global HttpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type','application/json');
        res.setBody('{"accountId" : "123132" }');
        res.setStatusCode(200);
        return res;
    }
}
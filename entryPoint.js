'use strict';
var handler = require("./handler.js")

module.exports.in = async (event) => {
    var isAzure = !("httpMethod" in event)
    if(isAzure) {
        var context = event;
        event = context.req;
        // var az_azure_map = {"accept": "Accept",
        //                     "accept-encoding":"Accept-Encoding",
        //                     "accept-language": "Accept-Language",
        //                     "host": "Host"}
        // delete Object.assign(event, {["httpMethod"]: event["method"] })["method"];
        // delete Object.assign(event, {["queryStringParameters"]: event["query"] })["query"];
        // delete Object.assign(event, {["pathParameters"]: event["params"] })["params"];
        // event["headers"].map((v,i) => {
        //     if(az_azure_map[v]){
        //         delete Object.assign(event["headers"], {[v]: event["headers"][az_azure_map[v]] })[az_azure_map[v]];
        //     }
        // });
        delete Object.assign(event, {["httpMethod"]: event["method"] })["method"];
        delete Object.assign(event, {["queryStringParameters"]: event["query"] })["query"];
        delete Object.assign(event, {["pathParameters"]: event["params"] })["params"];
        delete Object.assign(event["headers"], {["Accept"]: event["headers"]["accept"] })["accept"];
        delete Object.assign(event["headers"], {["Accept-Encoding"]: event["headers"]["accept-encoding"] })["accept-encoding"];
        delete Object.assign(event["headers"], {["Accept-Language"]: event["headers"]["accept-language"] })["accept-language"];
        delete Object.assign(event["headers"], {["Host"]: event["headers"]["host"] })["host"];
    }

    var resp = await handler.hello(event)

    if(context) {
        context.res = resp;
    } else {
        return resp;
    }
}
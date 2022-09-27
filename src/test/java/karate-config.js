//1:12
function fn() {
var env = karate.env;
karate.log('karate.env system property was:', env);
if (!env) {
env = 'dev';// a custom 'intelligent' default
}
var config = {// base config JSON     appId: '12344',     appSecret: '12345',     username:'xx.github.com',
appId: 'my.app.id',
appSecret: 'my.secret',
someUrlBase: 'https://some-hote.com/v1/auth',
anotherUrlBase: 'https://another-host.com/v1/',
url: 'https://jsonplaceholder.typicode.com/',
urlDeux: 'https://jsonplaceholder.typicode.com/users'
};
//get called once and store the result in the 'result'     result=karate.callsingle('classpath:authentication/Authenticate.feature',config);
if (karate.env != 'mock' && karate.env != 'proxy' && karate.env != 'contract')
{
config.someUrlBase = 'https://stage-host/v1/auth';
} else if (enc == 'e2e') {
    config.someUrlBase = 'https://e2e-host/v1:auth';
}
karate.configure('connectTimeout', 5000);
karate.configure('readTimeout', 5000);
return config;
 }
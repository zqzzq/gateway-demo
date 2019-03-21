#!/bin/bash
openssl genrsa -out ca.key 2048
openssl req -new -x509 -days 365 -key ca.key -subj "/C=CN/ST=BJ/O=Inspur/CN=Root CA" -out ca.crt

openssl genrsa -out server.key 2048

openssl req -new -sha256 \
    -key server.key \
    -subj "/C=CN/ST=BJ/O=Inspur/CN=mytest.gateway.com" \
    -out server.csr

openssl x509 -req -extfile <(printf "subjectAltName=DNS:*.gateway.com,DNS:*.health.gateway.com") -days 365 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt

#creat the secret istio-ingressgateway-certs,istio-egressgateway-certs
kubectl create -n istio-system secret tls istio-ingressgateway-certs --key ./server.key --cert ./server.crt
kubectl create -n istio-system secret tls istio-egressgateway-certs --key ./server.key --cert ./server.crt

#enable rbac
kubectl create -f rbac.yaml
kubectl create -f gateways.yaml
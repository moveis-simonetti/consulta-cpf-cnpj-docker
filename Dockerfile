FROM golang:latest
ENV GOPATH /usr/local/consulta-cpf-cnpj-server
RUN apt-get update \
	&& apt-get install -y pkg-config  libcurl4-openssl-dev \
	&& cd /usr/local \
	&& git clone https://eminetto@bitbucket.org/coderockr/consulta-cpf-cnpj-server.git \
	&& cd consulta-cpf-cnpj-server.git \
	&& go get github.com/PuerkitoBio/goquery \
	&& go get github.com/andelf/go-curl \
    && go get github.com/go-martini/martini \
    && go get github.com/ryanuber/go-filecache \
	&& get github.com/andelf/iconv-go \
	&& go build

EXPOSE 3000

CMD ["/usr/local/consulta-cpf-cnpj-server/consulta-cpf-cnpj-server"]

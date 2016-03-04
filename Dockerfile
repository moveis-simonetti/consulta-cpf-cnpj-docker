FROM golang:1.5.3
ENV GOPATH /usr/local/consulta-cpf-cnpj-server
RUN mkdir /root/.ssh
ADD id_rsa /root/.ssh/id_rsa
ADD id_rsa.pub /root/.ssh/id_rsa.pub

RUN chmod 600 /root/.ssh/id_rsa* \
    && touch /root/.ssh/known_hosts \
    && ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts \
    && apt-get update \
	&& apt-get install -y pkg-config  libcurl4-openssl-dev \
	&& cd /usr/local \
    && git clone git@bitbucket.org:coderockr/consulta-cpf-cnpj-server.git \
	&& cd consulta-cpf-cnpj-server \
	&& go get github.com/PuerkitoBio/goquery \
	&& go get github.com/andelf/go-curl \
    && go get github.com/go-martini/martini \
    && go get github.com/ryanuber/go-filecache \
	&& go get github.com/andelf/iconv-go \
	&& go build

EXPOSE 3000

CMD ["/usr/local/consulta-cpf-cnpj-server/consulta-cpf-cnpj-server"]

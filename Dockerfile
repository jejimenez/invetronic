 FROM python:3
 ENV PYTHONUNBUFFERED 1
 RUN mkdir /code
 WORKDIR /code
 ADD requirements.txt /code/
 RUN apt-get update && apt-get -y -q install libreoffice-core libreoffice-common unoconv fonts-opensymbol hyphen-de hyphen-en-us hyphen-it fonts-dejavu fonts-dejavu-core fonts-dejavu-extra fonts-droid fonts-dustin fonts-f500 fonts-fanwood fonts-freefont-ttf fonts-liberation fonts-lmodern fonts-lyx fonts-sil-gentium fonts-texgyre fonts-tlwg-purisa && apt-get -q -y remove libreoffice-gnome
 RUN pip install -r requirements.txt
 ADD . /code/

 # Install nodejs

 RUN curl -sL https://deb.nodesource.com/setup_4.x | bash 
 USER root
 RUN apt-get -y install nodejs
 RUN npm install --global bower
 RUN bower install --allow-root
 RUN apt-get clean 
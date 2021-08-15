# build and run jekyll site

# build container:
FROM ruby:3.0 as build
# ENV JEKYLL_ENV: production
WORKDIR /usr/src/app
COPY Gemfile ./
RUN bundle install
COPY . .
RUN bundle exec jekyll build

# run container:
FROM nginx:alpine as run 
COPY --from=build /usr/src/app/_site /usr/share/nginx/html

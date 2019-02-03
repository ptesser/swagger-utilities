# Swagger Utilities

**Status**: Work in progress

## Front End

Usually on a modern front end application we have a `package.json` file that manages all external dependencies.

Inside it we could also add some custom command that run something using `npm run <name>`.

To generate Swagger Client we set some custom scripts as below.

This **example** is valid for Typescript Angular generator of Swagger version 2 inside an Angular progect.

I'm assuming that Swagger tools are under `doc/api/` folder and that there is another folder on the same repository that manages the front-end (`front-end/`).

Structure:

```
.
├── doc
│   ├── api
│       └── scripts/
|       └──  templates-typescript-angular/
|       └── api.yaml
├── front-end
│   ├── .gitignore
│   └── src
├── .gitignore
└── README.md

```

```JSON
{
  "name": "front-end",
  "version": "0.0.0",
  "scripts": {
    "postinstall": "npm run regen-rest",
    "regen-rest": "sh ../doc/api/scripts/regen-angular.sh ../doc/api/templates-typescript-angular ../front-end/src/backend-connector/ ../doc/api/rest-api.yaml",
    "lint-fix": "node_modules/.bin/tslint --project tsconfig.json --config tslint.json --fix ./src/backend-connector/**/*.ts --format verbose"
  }
}
```

Templates, that you can find in this repository are for **Typescript Angular**, try to follow these rules:

- https://gist.github.com/ptesser/d1c7aad4be339dd3a6fb7ee5471b7819
- https://gist.github.com/ptesser/ef8c891dfc3a87d4d5136d9ad722eb7a

Sometimes there are some warnings, so I fix it running `npm run lint-fix`.

## Gitignore

Remember to add the output of Swagger generator to the files to exclude.

For example above, add inside the front end repository:

```
# .gitignore file

# Swagger
src/backend-connector
swagger-codegen-cli.jar
```

We want that every developer could regen all automatic code when APIs specification change.

# grpc-client-egg
> An egg grpc client written in Typescript.

## How to use
1 install
```sh
npm i -S grpc-client-egg
```
2 include
```ts
import { EggPlugin } from 'egg'

const plugin: EggPlugin = {

    routerPlus: {
        enable: true,
        package: 'egg-router-plus',
    },
    grpcClient: {
        enable: true,
        package: 'grpc-client-egg',
    },
}
export default plugin

```
3 config
```ts
import { EggAppConfig, PowerPartial } from 'egg'

export default () => {
    const config: PowerPartial<EggAppConfig> = {

        grpcClient: {
            clients: [
                {
                    name: 'main',
                    protoPath: 'app/proto/main',
                    host: '0.0.0.0',
                    port: 50051,
                },
            ],
        },
    }
    return config
}
```
4 invoke promisified grpc service methods
```ts
import { Service } from 'egg'

export default class Greeter extends Service {

    readonly service: GreeterService = this.app.grpcClient.main.greeter.Greeter

    public async sayHello(name: string) {
        return this.service.sayHello({ name })
    }

    public async sayGoodbye(name: string) {
        return this.service.sayGoodbye({ name })
    }
}
```

## Default config from the plugin
```ts
    loaderOption: {
        keepCase: true,
        longs: String,
        enums: String,
        defaults: true,
        oneofs: true,
    },

    clients: [
        {
            name: 'main',
            protoPath: 'app/proto/main',
            host: '0.0.0.0',
            port: 50051,
        },
    ],
```

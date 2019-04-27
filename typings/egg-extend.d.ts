import 'egg';

declare module 'egg' {
    interface Application {
        grpcClient: any
    }
}

import {
    Db,
    DeleteResult,
    Filter,
    MongoClient,
    MongoClientOptions,
    OptionalId,
    ServerApiVersion,
    UpdateFilter,
    UpdateResult,
    WithId,
} from 'mongodb';

class DatabaseConnection {
    private uri: string;
    private dbName: string;
    private database: Db | undefined = undefined;

    constructor(options: { uri: string; dbName: string }) {
        this.uri = options.uri;
        this.dbName = options.dbName;
        this.connect()
    }

    /**
     * Establishes a connection to the MongoDB database.
     * @param {MongoClientOptions} [options] - Optional configuration for the MongoDB client.
     * @returns {Promise<{ client: MongoClient, db: Db }>} A promise that resolves to an object containing the MongoClient and the connected database (Db).
     * @throws {Error} If the connection to the database fails.
     *
     * @example
     * // Creating a new DatabaseConnection instance
     * const database = new DatabaseConnection({
     *   uri: 'mongodb://localhost:27017',
     *   dbName: 'polycutter'
     * });
     *
     * // Connecting to the database
     * const { client, db } = await database.connect({
     *   connectTimeoutMS: 1000
     * });
     *
     * // Accessing a collection and performing database operations
     * const collection = db.collection('nameCollection');
     * const insertResult = await collection.insertOne({
     *   name: 'ElaXan',
     *   sex: 'male'
     * });
     */
    public async connect(options?: MongoClientOptions) {
        try {
            if (this.database) {
                return;
            }
            const configuration = new MongoClient(this.uri, {
                serverApi: {
                    version: ServerApiVersion.v1,
                    strict: true,
                    deprecationErrors: true
                }
            });
            const connect = await configuration.connect();
            this.database = connect.db(this.dbName);
        } catch (error) {
            const maxRetries = 3;
            let retryCount = 0;
            while (retryCount < maxRetries) {
                retryCount++;
                console.log(`Failed to establish a database connection. Retrying (${retryCount}/${maxRetries})...`);
                try {
                    const configuration = new MongoClient(this.uri, options);
                    const connect = await configuration.connect();
                    this.database = connect.db(this.dbName);
                    return;
                } catch (error) {
                    continue;
                }
            }
            throw new Error(`Failed to establish a database connection after ${maxRetries} retries.\n${error}`);
        }
    }


    /**
     * @param collectionName Name of the collection to insert the document in
     * @param body Body to insert into the collection e.g. { name: 'John' }
     * @returns Returns the result of the insert
     * @description Inserts one document into the collection
     * @example
     * const result = await insertOne('users', { name: 'John' });
     * console.log(result);
     */
    async insertOne(collectionName: string, body: OptionalId<any>) {
        try {
            if (!this.database) {
                throw new Error('No database connection established');
            }
            const collection = this.database.collection(collectionName);
            return await collection.insertOne(body, {});
        } catch (error) {
            throw new Error(`Failed inserting one document.\n${error}`);
        }
    }

    /**
     * @param collectionName Name of the collection to insert the documents in
     * @param body Body to insert into the collection e.g. [{ name: 'John' }, { name: 'Jane' }]
     * @returns Returns the result of the insert
     * @description Inserts multiple documents into the collection
     * @example
     * const result = await insertMany('users', [{ name: 'John' }, { name: 'Jane' }]);
     * console.log(result);
     */
    async read(collectionName: string) {
        try {
            return this.connect().then((database) => {
                if (!this.database) {
                    throw new Error('No database connection established');
                }
                const collection = this.database.collection(collectionName);
                return collection.find({}).toArray();
            });
        } catch (error) {
            throw new Error(`Failed reading documents.\n${error}`);
        }
    }

    /**
     * @param collectionName Name of the collection to insert the documents in
     * @param body Body to insert into the collection e.g. [{ name: 'John' }, { name: 'Jane' }]
     * @returns Returns the result of the insert
     * @description Inserts multiple documents into the collection
     * @example
     * const result = await insertMany('users', [{ name: 'John' }, { name: 'Jane' }]);
     * console.log(result);
     */
    async deleteOne(collection: string, body: Filter<any>): Promise<DeleteResult> {
        try {
            if (!this.database) {
                throw new Error('No database connection established');
            }
            return await this.database.collection(collection).deleteOne(body);
        } catch (error) {
            throw new Error(`Failed deleting documents.\n${error}`);
        }
    }

    /**
     * @param collectionName Name of the collection to insert the documents in
     * @param body Body to insert into the collection e.g. [{ name: 'John' }, { name: 'Jane' }]
     * @returns Returns the result of the insert
     * @description Inserts multiple documents into the collection
     * @example
     * const result = await insertMany('users', [{ name: 'John' }, { name: 'Jane' }]);
     * console.log(result);
     */
    async dropCollection(collectionName: string): Promise<boolean> {
        try {
            if (!this.database) {
                throw new Error('No database connection established');
            }
            const collection = this.database.collection(collectionName);
            return collection.drop();
        } catch (error) {
            throw new Error(`Failed dropping collection.\n${error}`);
        }
    }

    /**
     * @param collectionName Name of the collection to find the document in
     * @param body Body to find the document with e.g. { _id: ObjectId('...') }
     * @returns Returns the result of the find
     * @description Finds one document in the collection
     * @example
     * const result = await findOne('users', { _id: ObjectId('...') });
     * console.log(result);
     */
    async findOne(collectionName: string, body: Filter<any>): Promise<WithId<any> | null> {
        try {
            if (!this.database) {
                throw new Error('No database connection established');
            }
            const collection = this.database.collection(collectionName);
            return await collection.findOne(body);
        } catch (error) {
            throw new Error(`Failed finding one document.\n${error}`);
        }
    }

    /**
     * @param collectionName Name of the collection to update
     * @param filter Filter to find the document to update e.g. { _id: ObjectId('...') }
     * @param body Body to update the document with e.g. { $set: { name: 'John' } }
     * @returns Returns the result of the update
     * @description Updates one document in the collection
     * @example
     * const result = await updateOne('users', { _id: ObjectId('...') }, { $set: { name: 'John' } });
     * console.log(result);
     */
    async updateOne(
        collectionName: string,
        filter: Filter<any>,
        body: UpdateFilter<Document> | Partial<Document>,
    ): Promise<UpdateResult<any>> {
        try {
            if (!this.database) {
                throw new Error('No database connection established');
            }
            const collection = this.database.collection(collectionName);
            return await collection.updateOne(filter, body);
        } catch (error) {
            throw new Error(`Failed updating one document.\n${error}`);
        }
    }

    /**
     * @description Pings the database
     * @returns Returns the result of the ping
     */
    async ping() {
        try {
            if (!this.database) {
                throw new Error('No database connection established');
            }
            return this.database.command({ ping: 1 });
        } catch (error) {
            throw new Error(`Something went wrong pinging database.\n${error}`);
        }
    }
}

export default DatabaseConnection;
import {
    DeleteResult,
    Filter,
    MongoClient,
    MongoClientOptions,
    OptionalId,
    UpdateFilter,
    UpdateResult,
    WithId,
    WithoutId,
} from 'mongodb';

class DatabaseConnection {
    private uri: string;
    private dbName: string;

    constructor(options: { uri: string; dbName: string }) {
        this.uri = options.uri;
        this.dbName = options.dbName;
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
    async connect(options?: MongoClientOptions) {
        try {
            const configuration = new MongoClient(this.uri, options);
            const client = await configuration.connect();
            const db = client.db(this.dbName);

            return { client, db };
        } catch (error) {
            throw new Error(`Failed to establish a database connection.\n${error}`);
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
            return this.connect().then(async (database) => {
                const collection = database.db.collection(collectionName);
                return await collection.insertOne(body, {});
            });
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
                const collection = database.db.collection(collectionName);
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
    async deleteOne(collection: string, body: object): Promise<DeleteResult> {
        try {
            return await this.connect().then(async (database) => {
                return await database.db.collection(collection).deleteOne(body);
            });
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
            return await this.connect().then((database) => {
                const collection = database.db.collection(collectionName);
                return collection.drop();
            });
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
            return await this.connect().then(async (database) => {
                const collection = database.db.collection(collectionName);
                return await collection.findOne(body);
            });
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
            return await this.connect().then(async (database) => {
                const collection = database.db.collection(collectionName);
                return await collection.updateOne(filter, body);
            });
        } catch (error) {
            throw new Error(`Failed updating one document.\n${error}`);
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
     * @deprecated Use updateOne instead
     * @see updateOne
     */
    async newOne(collectionName: string, filter: Filter<any>, body: WithoutId<any>): Promise<WithId<any> | null> {
        try {
            return this.connect().then(async (database) => {
                const collection = database.db.collection(collectionName);
                return await collection.findOneAndReplace(filter, body);
            });
        } catch (error) {
            throw new Error(`Failed to creating new document.\n${error}`);
        }
    }

    /**
     * @description Pings the database
     */
    async ping() {
        try {
            return this.connect().then((database) => {
                return database.db.command({ ping: 1 });
            });
        } catch (error) {
            throw new Error(`Something went wrong pinging database.\n${error}`);
        }
    }
}

export default DatabaseConnection;
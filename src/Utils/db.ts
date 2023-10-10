import {
    DeleteResult,
    Filter,
    MongoClient,
    OptionalId,
    ServerApiVersion,
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
     * Connects to the database.
     * @returns {Promise<{ client: MongoClient; db: Db }>} The client and database.
     * @throws {Error} Failed connecting to the database.
     * @memberof DatabaseConnection
     * @async
     * @inner
     * @function connect
     * @instance
     * @private
     * @example
     * const { client, db } = await connect();
     * const collection = db.collection('collectionName');
     * const result = await collection.insertOne({ name: 'John' });
     * console.log(result);
     */
    async connect() {
        try {
            const configuration = new MongoClient(this.uri, {
                serverApi: {
                    version: ServerApiVersion.v1,
                    strict: true,
                    deprecationErrors: true,
                },
            });
            const client = await configuration.connect();
            const db = client.db(this.dbName);

            return { client, db };
        } catch (error) {
            throw new Error(`Failed connecting to the database.\n${error}`);
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
            const result = this.connect().then(async (database) => {
                const collection = database.db.collection(collectionName);
                const result = await collection.insertOne(body, {});
                return result;
            });
            return result;
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
            const result = this.connect().then((database) => {
                const collection = database.db.collection(collectionName);
                const result = collection.find({}).toArray();
                return result;
            });
            return result;
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
            const result = await this.connect().then(async (database) => {
                const result = await database.db.collection(collection).deleteOne(body);
                return result;
            });
            return result;
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
            const result = await this.connect().then((database) => {
                const collection = database.db.collection(collectionName);
                const result = collection.drop();
                return result;
            });
            return result;
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
            const result = await this.connect().then(async (database) => {
                const collection = database.db.collection(collectionName);
                const result = await collection.findOne(body);
                return result;
            });
            return result;
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
            const result = await this.connect().then(async (database) => {
                const collection = database.db.collection(collectionName);
                const result = await collection.updateOne(filter, body);
                return result;
            });
            return result;
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
            const result = this.connect().then(async (database) => {
                const collection = database.db.collection(collectionName);
                const result = await collection.findOneAndReplace(filter, body);
                return result;
            });
            return result;
        } catch (error) {
            throw new Error(`Failed to creating new document.\n${error}`);
        }
    }

    /**
     * @description Pings the database
     */
    async ping() {
        try {
            const result = this.connect().then((database) => {
                const result = database.db.command({ ping: 1 });
                return result;
            });
            return result;
        } catch (error) {
            throw new Error(`Something went wrong pinging database.\n${error}`);
        }
    }
}

export default DatabaseConnection;
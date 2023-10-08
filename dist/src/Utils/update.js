"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const listr2_1 = require("listr2");
const prompt_adapter_enquirer_1 = require("@listr2/prompt-adapter-enquirer");
const shell_1 = require("./shell");
function handleUpdate(body) {
    return __awaiter(this, void 0, void 0, function* () {
        console.log('Update available');
        console.log(`Description: ${body.description}`);
        console.log(`Version: ${body.version}`);
        if (body.changelog.length > 0) {
            console.log('Changelog:');
            body.changelog.forEach((item) => {
                console.log('- ' + item);
            });
        }
        new listr2_1.Listr([
            {
                title: 'Getting you on-board.',
                task: (ctx, task) => __awaiter(this, void 0, void 0, function* () {
                    ctx.update = yield task.prompt(prompt_adapter_enquirer_1.ListrEnquirerPromptAdapter).run({
                        message: 'Do you want to update GCAndroid?',
                        type: 'Confirm',
                        initial: true
                    });
                })
            },
            {
                title: 'Updating GCAndroid',
                skip: (ctx) => !ctx.update,
                task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                    return new Promise((resolve, reject) => {
                        (0, shell_1.shell)('npm i -g https://github.com/Score-Inc/GCAndroid', 0, (data) => {
                            if (data !== null) {
                                task.output = `${data}`;
                            }
                        }).then(() => {
                            resolve();
                        }).catch((err) => {
                            reject(err);
                        });
                    });
                })
            }
        ], {
            concurrent: false,
            renderer: 'default',
            rendererOptions: {
                collapseSubtasks: false
            }
        }).run();
    });
}
exports.default = handleUpdate;

'use strict';

import fs from 'fs';

const existsPath = function (path) {
  return fs.existsSync(path);
};

const createFolder = async function (path) {
  try {
    fs.mkdirSync(path);
  } catch (err) {
    throw new Error(`Criar diretório no servidor: ${err.message}`);
  }
};

const createFile = async function (path, data) {
  try {
    return fs.writeFileSync(path, data);
  } catch (err) {
    throw new Error(`Criando arquivo no servidor: ${err.message}`);
  }
};

const deleteFile = async function (path) {
  try {
    return fs.unlinkSync(path);
  } catch (err) {
    throw new Error(`Removendo arquivo no servidor: ${err.message}`);
  }
};

const readFile = async function (path) {
  return new Promise((resolve, reject) => {
    fs.readFile(path, (err, data) => {
      if (err) {
        reject(`Erro na Leitura de arquivo no servidor: ${err.message}`);
      } else {
        resolve(data);
      }
    });
  });
};

const readFileUtf8 = async function (path) {
  return new Promise((resolve, reject) => {
    fs.readFile(path, 'utf-8', (err, data) => {
      if (err) {
        reject(`Erro na Leitura de arquivo no servidor: ${err.message}`);
      } else {
        resolve(data);
      }
    });
  });
};

const readDirectory = async function (dir) {
  return new Promise((resolve, reject) => {
    // função bloqueante.
    fs.readdir(dir, (err, data) => {
      if (err) {
        reject(`Erro na Leitura do Diretório no servidor: ${err.message}`);
      } else {
        resolve(data);
      }
    });
  });
};

const writeFile = async function (base64Data, pathFile) {
  return new Promise((resolve, reject) => {
    fs.writeFile(pathFile, base64Data, 'base64', (err, data) => {
      if (err) {
        reject(`Erro na Escrita do arquivo no servidor: ${err.message}`);
      } else {
        resolve(data);
      }
    });
  });
};
/**
 * Verifica se o path é um arquivo
 */
const isFile = async (path) => {
  if (!existsPath(path)) {
    throw `Diretório ${path} não existe`;
  }
  return new Promise((resolve, reject) => {
    fs.stat(path, (err, stats) => {
      if (err) reject(err);
      resolve(stats.isFile());
    });
  });
};

export default {
  existsPath,
  createFolder,
  createFile,
  deleteFile,
  readFile,
  readFileUtf8,
  readDirectory,
  writeFile,
  isFile,
};

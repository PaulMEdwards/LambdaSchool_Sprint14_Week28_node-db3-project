const express = require('express');

const server = express();
server.use(express.json());

const SchemeRouter = require('./schemes/scheme-router.js');
server.use('/api/schemes', SchemeRouter);

module.exports = server;

// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.

// -----------------------------------------------------------------------------
// IMPORTANT 
// Configuration constants.
// On your fork or clone please set these values to match with your environment.
// -----------------------------------------------------------------------------

// gRPC service address and port for the Quake Service to fetch earthquakes.
// (if left empty then GeoJSON service is used to fetch earthquakes as a fallback)
const String QUAKE_SERVICE_ADDRESS = "";
const int QUAKE_SERVICE_PORT = 443;
const bool QUAKE_SERVICE_IS_SECURE = true;

// Your registered username needed for the API usage of GeoNames.org.
// (if left empty then place searches do not work at all as a fallback)
const String GEONAMES_USERNAME = "";

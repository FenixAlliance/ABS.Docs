# ABS Signator | DIAN FY2020 Edition. (Colombia Only)

[[_TOC_]]

[![version](https://img.shields.io/badge/version-2.0.0-blue.svg)](#) [![build](https://img.shields.io/badge/build-passing-brightgreen.svg)](#)

**ABS Signator | DIAN FY2020 Edition** es un módulo de la **Alliance Business Suite** que permite firmar los documentos XML (facturas, notas de crédito/débito y eventos) producidas con el click de un botón por el **ABS Accounting Module** en conjunto con el **ABP DIAN REST Endpoint Set**, listas para ser presentadas a la **Dirección de Impuestos y Aduanas Nacionales de Colombia "DIAN"**, para hacer efectivo el proceso de facturación electrónica (versión Validación Previa).

### Uso

El **ABP DIAN REST Endpoint Set** contiene un sencillo endpoint HTTP (en tres variantes) para firmar cada uno de los documentos electrónicos creados por el **ABS Accounting Module** en el **ABP Invoice Vault** respectivo de cada Business Tenant, produciendo junto con este un archivo correspondiente al documento firmado, completando con ello el primer paso en el ciclo de facturación electrónica.

### Motivación

Desde el 1 de enero del 2019 la facturación electrónica para los contribuyentes en Colombia es obligatoria, y en la actualidad muchas empresas y personas obligadas no la han implementado. 

Aunque la información técnica proveída por la DIAN debería ser suficiente, encontrar recursos gratuitos para este proceso resulta ser bastante difícil. La generación de documentos XML y consumo de servicios web puede ser laborioso pero se puede hacer sin inconvenientes, en cambio la firma requerida por la DIAN puede ser extremadamente difícil de hacer, hasta el punto de ser necesario adquirir soluciones costosas.

La ABS, ABS Signator y el ABP DIAN REST Endpoint Set se integran con el objetivo de facilitar la implementación de facturación electrónica sin mayor complicación.

### Requisitos

Para poder generar, firmar y emitir documentos electrónicos (facturas y notas de débito/crédito) ante la DIAN, se deben cumplir los siguientes requisitos:

* Estar registrado como facturador electrónico
* Disponer de un certificado digital para la facturación electrónica

Para mayor información ver los recursos disponibles en [DIAN - Facturación Electrónica](https://www.dian.gov.co/fizcalizacioncontrol/herramienconsulta/FacturaElectronica/).

### Reconocimientos

Este proyecto utiliza las siguientes librerías:

- [Microsoft.Xades](#reconocimientos) por *Microsoft France*
- [BouncyCastle.Crypto](https://www.bouncycastle.org/csharp/) por *The Legion Of The Bouncy Castle*
- [FirmaXadesNet](https://github.com/ctt-gob-es/FirmaXadesNet) por *el Dpto. de Nuevas Tecnologías de la Dirección General de Urbanismo del Ayto. de Cartagena*

## Types of documents:

- ### Invoice
- ### Debit note
- ### Crefit Note

## Licencia

Revisar detalles en el archivo [LICENCE](/English/About/Legal/Terms-and-conditions).
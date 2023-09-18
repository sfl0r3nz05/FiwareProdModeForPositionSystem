# Prod Mode: FIWARE Deployment for Positioning System

This project constitues the *Production Mode* of the [Fiware Development for Positioning System](https://github.com/PositioningSystem/FiwareDevModeForPositionSystem) project. This is project is an ad-hoc implementation for sending positioning data using the [SDG](https://github.com/sfl0r3nz05/CSV-Data-Sender.git) and [Publisher Agent](https://github.com/sfl0r3nz05/Publisher-Agent.git) projects.

## Project status

- The project is under development: 🛠 by [sfl0r3nz05](sfigueroa@ceit.es)

## Architecture

![Architecture](./documentation/images/ArchitectureK8s.png)

## How to use

1. [Prerequisites](./documentation/prerequisites.md).
2. [Manual component deployment](./documentation/manual_deployment.md).
3. [Deployed components provisioning](./documentation/provisioning.md).
4. [Sending data on deployed components](./documentation/sending_data.md).

   ### Demonstration

   - [Demonstration of sending data to the next information flow: SDG -> Publisher Agent MQTT -> Fiware](https://youtu.be/Ynww1Nbpxbc)

## To Do

1. Create a full secure branch
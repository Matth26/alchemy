// quick hack generated from manifest
// todo: move to core

const fs = require('fs');
const path = require('path');

// Path to the input JSON file
const jsonFilePath = path.resolve(__dirname, 'manifest.json');

// Path to the output JS file
const jsFilePath = path.resolve(__dirname, 'output.ts');

// Read the JSON file
fs.readFile(jsonFilePath, 'utf8', (err, jsonString) => {
  if (err) {
    console.log('Error reading file:', err);
    return;
  }

  try {
    // Parse JSON string to an object
    const data = JSON.parse(jsonString);

    // Start of the output JS file content
    let fileContent = `/* Autogenerated file. Do not edit manually. */\n\n`;
    fileContent += `import { defineComponent, Type as RecsType, World } from "@latticexyz/recs";\n\n`;
    fileContent += `export function defineContractComponents(world: World) {\n  return {\n`;

    // Generate a section for each component
    data.components.forEach((component) => {
      const tableName = component.name;
      fileContent += `    ${tableName}: (() => {\n`;
      fileContent += `      const name = "${tableName}";\n`;
      fileContent += `      return defineComponent(\n        world,\n        {\n`;

      // Generate a line for each member of the component
      component.members.forEach((member) => {
        // Convert member types to a JS equivalent
        let memberType = 'RecsType.Unknown';
        if (
          member.type === 'u8' ||
          member.type === 'u16' ||
          member.type === 'u32' ||
          member.type === 'usize' ||
          member.type === 'u64' ||
          member.type === 'u128' ||
          member.type === 'u250' ||
          member.type === 'felt252' ||
          member.type === 'ContractAddress'
        ) {
          memberType = 'RecsType.Number';
        } else if (member.type === 'bool') {
          memberType = 'RecsType.Boolean';
        } else if (member.type === 'u256') {
          memberType = 'RecsType.NumberArray';
        }
        fileContent += `          ${member.name}: ${memberType},\n`;
      });

      fileContent += `        },\n        {\n`;
      fileContent += `          metadata: {\n`;
      fileContent += `            name: name,\n`;
      fileContent += `          },\n        }\n      );\n    })(),\n`;
    });

    fileContent += `  };\n}\n`;

    // Write the generated JS file content
    fs.writeFile(jsFilePath, fileContent, (err) => {
      if (err) {
        console.log('Error writing file:', err);
      } else {
        console.log('File generated successfully');
      }
    });
  } catch (err) {
    console.log('Error parsing JSON string:', err);
  }
});
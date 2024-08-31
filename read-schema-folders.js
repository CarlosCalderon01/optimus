const fs = require('fs');
const path = require('path');

function generateFolderStructure(dirPath, prefix = '') {
  let structure = '';
  const items = fs.readdirSync(dirPath);

  items.forEach((item, index) => {
    const itemPath = path.join(dirPath, item);
    const isLastItem = index === items.length - 1;
    const connector = isLastItem ? '└── ' : '├── ';

    structure += `${prefix}${connector}${item}\n`;

    if (fs.statSync(itemPath).isDirectory()) {
      const newPrefix = prefix + (isLastItem ? '    ' : '│   ');
      structure += generateFolderStructure(itemPath, newPrefix);
    }
  });

  return structure;
}

function writeStructureToFile(dirPath, outputFile) {
  const structure = generateFolderStructure(dirPath);
  fs.writeFileSync(outputFile, structure);
  console.log(`Estructura de carpetas guardada en: ${outputFile}`);
}

// Cambia la ruta a la raíz de tu proyecto (ahora relativa)
const projectRoot = path.join(__dirname, 'src');
const outputFilePath = path.join('temp', 'folder-structure.txt');

// Crea la carpeta de salida si no existe
if (!fs.existsSync('temp')) {
  fs.mkdirSync('temp', { recursive: true });
}

writeStructureToFile(projectRoot, outputFilePath);

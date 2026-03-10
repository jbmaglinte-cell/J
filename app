<!DOCTYPE html>
<html>
<head>
    <title>DOCTO PDF Reader</title>
    <style>
        body { font-family: Arial; max-width: 600px; margin: 50px auto; padding: 20px; }
        .upload { border: 2px dashed #007bff; padding: 30px; text-align: center; }
        #content { margin-top: 20px; padding: 20px; background: #f9f9f9; }
        .date { color: #d00; font-weight: bold; }
    </style>
</head>
<body>
    <h1>DOCTO - Upload PDF</h1>
    <div class="upload">
        <input type="file" id="file" accept=".pdf" />
        <p>Upload your Mobile App Proposal PDF</p>
    </div>
    <div id="content"></div>

    <script>
        document.getElementById('file').onchange = function(e) {
            const file = e.target.files[0];
            const reader = new FileReader();
            reader.onload = function() {
                const text = extractDates(reader.result);
                document.getElementById('content').innerHTML = text;
            };
            reader.readAsText(file);
        };

        function extractDates(content) {
            // Find dates from your proposal
            let output = '<h3>Found Dates:</h3>';
            const dates = content.match(/\b(January|February|March|April|May|June|July|August|September|October|November|December)\s+\d{1,2},?\s+2026/gi) || [];
            dates.forEach(date => {
                output += `<p class="date">📅 ${date}</p>`;
            });
            if (dates.length === 0) output += '<p>No dates found</p>';
            return output;
        }
    </script>
</body>
</html>

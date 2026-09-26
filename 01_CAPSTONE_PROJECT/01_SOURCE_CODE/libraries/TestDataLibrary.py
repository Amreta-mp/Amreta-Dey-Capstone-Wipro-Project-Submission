import csv


class TestDataLibrary:

    def read_csv_data(self, file_path):
        """Reads a CSV file and returns a list of dictionaries, one per row."""
        data = []
        with open(file_path, newline='', encoding='utf-8') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                data.append(row)
        return data
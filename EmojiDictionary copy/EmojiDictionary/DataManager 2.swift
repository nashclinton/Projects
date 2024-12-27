import Foundation

class DataManager {

    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        print("Documents Directory: \(documentsDirectory)")
        return documentsDirectory
    }

    static func saveBooksToPlist(books: [Book]) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(books)
            let fileURL = getDocumentsDirectory().appendingPathComponent("books.plist")
            print("Saving books to: \(fileURL)")
            try data.write(to: fileURL)
            print("Books saved successfully.")
        } catch {
            print("Error saving books to plist: \(error)")
        }
    }

    static func loadBooksFromPlist() -> [Book]? {
        let fileURL = getDocumentsDirectory().appendingPathComponent("books.plist")
        if let data = try? Data(contentsOf: fileURL) {
            let decoder = PropertyListDecoder()
            do {
                let loadedBooks = try decoder.decode([Book].self, from: data)
                print("Books loaded from plist: \(loadedBooks)")
                return loadedBooks
            } catch {
                print("Error loading books from plist: \(error)")
            }
        }
        return nil
    }
}

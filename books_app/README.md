# books_app

An app for people that want to look up authors and see amount of work they published using https://openlibrary.org/ api.  
Users can search for authors name to get results that match the query.  
API Results are limited to 5.  
API calls are triggered on query change and bloc events utilize debounce with duration 1000ms to avoid spamming  

example debounce scenario where numbers are bloc events and dashes are 1000ms:  
source: 1-2-3---4---5-6-|  
result: ------3---4-----6|  

### Bloc Concepts
- State management using Bloc
- Event transformer for debounce implementation
- Simple code layering (presentation, domain, data layers)
- Utilizing BlocProvider, BlocBuilder





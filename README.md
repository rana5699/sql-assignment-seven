
# SQL_Assignment


### What is PostgreSQL?
PostgreSQL হল একটি বিনামূল্যের ওপেন-সোর্স ডাটাবেস সিস্টেম, যা রিলেশনাল (SQL) এবং নন-রিলেশনাল (JSON) উভয় ধরনের কুয়েরি সাপোর্ট করে।

PostgreSQL ডাইনামিক ওয়েবসাইট এবং ওয়েব অ্যাপ্লিকেশনের ব্যাকএন্ড ডাটাবেস হিসেবে ব্যবহার করা যায়।

### What is the purpose of a database schema in PostgreSQL?

PostgreSQL-এ ডাটাবেজ ইস্কিমা হল একটি কোনটেইনার যা ডাটাবেজ অবজেক্ট যেমন টেবিল, ভিউ, ইনডেক্স, ফাংশন, ইত্যাদি ধারণ এবং সংগঠিত করে এছাড়াও বিভিন্ন টেবিলের সাথে রিলেশন স্থাপন করতে সাহায্য করে, ডাটাবেজের নিরাপত্তা বৃদ্ধি করে এবং রক্ষণাবেক্ষণ সহজ করতে সাহায্য করে।

### Explain the Primary Key and Foreign Key concepts in PostgreSQL.
### Primary Key 
হলো একটি কলাম বা অনেকগুলো কলামের সমষ্টি যা একটি টেবিলের প্রতিটি রোকে আলাদাভাবে চিহ্নিত করে।
যা টেবিলের নিরাপত্তা বৃদ্ধি করে এবং কুয়েরি ব্যবহার করতে সাহায্য করে।

- প্রতিটি টেবিলের একটি প্রাইমারি কিই থাকতে পারে।
- প্রাইমারি টির মানগুলো ইউনিক এবং নট নাল হতে হয়। 
- এটা টেবিলের ডুবলিকেট ডাটা বা রো প্রতিরোধ করে।

### Foreign Key
- Foreign Key হলো একটি কলাম বা একাধিক কলামের সমষ্টি যা দুটি টেবিলের মধ্যে একটি রিলেশন তৈরি করে।
- এটি নিশ্চিত করে যে একটি টেবিলের রেকর্ড অন্য টেবিলে রেকর্ড এর সাথে সম্পর্কিত।

### What is the difference between the VARCHAR and CHAR data types?

#### VARCHAR এবং CHAR এর মধ্যে পার্থক্য:

- VARCHAR বিভিন্ন দৈর্ঘ্যের স্ট্রিং রাখ যায়।শুধু আসল স্ক্রিনের দৈর্ঘ্য অনুযায়ী জায়গা নেয়,এক্সট্রা কোন স্পেস যোগ করে না।
- CHAR সব সময় ফিক্সড  স্ট্রিং থাকে, ছোট স্ট্রিং হলে স্ট্রিং এর শেষে হোয়াইট স্পেস দিয়ে তা পূর্ণ হয়।


### Explain the purpose of the WHERE clause in a SELECT statement.
WHERE  ক্লোজ হলে SQL এর একটি অংশ যা SELECT  স্টেটমেন্টে ব্যবহার করা হয় এটি নির্দিষ্ট শর্তের ভিত্তিতে ডাটা ফিল্টার করে নিয়ে আসে।

### What are the LIMIT and OFFSET clauses used for?
- LIMIT হল ডাটাবেজ থেকে কতগুলি ডাটা পাঠাতে হবে তা নির্ধারণ করে।
- OFFSET কোথায় থেকে ডাটাটা পাঠাবো তা নির্ধারণ করে।

### How can you modify data using UPDATE statements?

UPDATE ব্যবহার করে একটি টেবিলের এক বা একাধিক ডাটার ভ্যালু পরিবর্তন করা যায়।

<!-- FOR SINGLE DATA UPDATE -->
    UPDATE books
    SET price = price * 1.10
    WHERE published_year = 2000

<!-- FOR SINGLE DATA ALL -->
    UPDATE books
    SET price = price * 1.10
    WHERE published_year < 2000

### What is the significance of the JOIN operation, and how does it work in PostgreSQL?

JOIN অপারেশন এস কি বলে বিভিন্ন টেবিলের ডেটা কম্বাইন করতে ব্যবহৃত হয়। এখানে একটা টেবিলের সাথে আরেকটা টেবিলের রিলেশন থাকে।
    
    SELECT SUM(b.price * o.quantity) 
    AS total_revenue
    FROM orders AS o
    JOIN books AS b ON o.book_id = b.id


### Explain the GROUP BY clause and its role in aggregation operations.
GROUP BY ক্লোসটি SQL এ ব্যবহৃত হয়, একটি বা একাধিক কলামের ভিত্তিতে ডাটা গুলোকে গ্রুপ করতে।
এটি সাধারণত এগ্রিগেশন ফাংশন (যেমন COUNT, SUM, AVG, MIN, MAX) এর সাথে ব্যবহার করা হয়।

    SELECT name, COUNT(*) AS orders_count
    FROM orders
    JOIN customers ON orders.customer_id = 
    customers.id
    GROUP BY name

### How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

PostgreSQL-এ COUNT(), SUM(), এবং AVG() এর মতো এগ্রিগেশন ফাংশন ব্যবহার করে একটি নির্দিষ্ট শর্ত পূর্ণকারী ডেটার উপর গণনা বা গাণিতিক অপারেশন করা হয়। এগুলো সাধারণত GROUP BY ক্লজের সাথে ব্যবহৃত হয়, তবে শর্ত না থাকলেও এগুলো ব্যবহার করা যেতে পারে।

## COUNT()
    SELECT name, COUNT(*) AS total_orders 
    FROM orders
    JOIN customers 
    ON orders.customer_id = customers.id
    GROUP BY name

## SUM()
    SELECT SUM(b.price * o.quantity) 
    AS total_revenue
    FROM orders 
    AS o
    JOIN books AS b ON o.book_id = b.id

## AVG()
    SELECT AVG(b.price)::NUMERIC(10,2) 
    AS avg_book_price 
    FROM books AS b

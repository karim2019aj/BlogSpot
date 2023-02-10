-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2023 at 08:53 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogproject`
--
CREATE DATABASE IF NOT EXISTS `blogproject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `blogproject`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `categories`:
--

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `name`, `description`) VALUES
(1, 'Java', 'Java is a widely-used, class-based, object-oriented programming language. Known for its robustness, scalability, and security, it is used for building enterprise applications and mobile apps.'),
(2, 'Python', 'Python is a high-level, interpreted language used for a wide range of purposes including web development, data analysis, and AI. Known for its simplicity and large community.'),
(3, 'C++', 'C++ is a high-performance, general-purpose language used for building large-scale systems and applications. Known for its efficiency, flexibility, and low-level capabilities.'),
(4, 'JavaScript', 'JavaScript is a client-side scripting language used for making websites dynamic and interactive. Essential for web development and widely used by millions of developers.'),
(5, 'C#', 'C# is an object-oriented language developed by Microsoft for building Windows desktop apps, mobile apps, and games. Known for its simplicity, scalability, and performance.'),
(6, 'Ruby', 'Ruby is a dynamic, object-oriented language used for web development and scientific computing. Known for its simplicity, elegance, and expressiveness.'),
(7, 'Swift', 'Swift is a general-purpose, multi-paradigm language developed by Apple. Used for building iOS, iPadOS, and macOS apps, known for its performance and modern syntax.'),
(8, 'Go', 'Go is an open source language developed by Google for large-scale, concurrent systems. Known for its simplicity, performance, and scalability, it is widely used for web apps and cloud computing.'),
(9, 'PHP', 'PHP is a server-side scripting language used for building dynamic websites and web applications. Widely used for its simplicity and support for a wide range of databases.');

-- --------------------------------------------------------

--
-- Table structure for table `liked`
--

CREATE TABLE `liked` (
  `lid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `liked`:
--   `pid`
--       `posts` -> `pid`
--   `uid`
--       `user` -> `id`
--

--
-- Dumping data for table `liked`
--

INSERT INTO `liked` (`lid`, `pid`, `uid`) VALUES
(35, 1, 1),
(34, 2, 1),
(33, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `pid` int(11) NOT NULL,
  `pTitle` varchar(150) DEFAULT NULL,
  `pContent` longtext DEFAULT NULL,
  `pCode` longtext DEFAULT NULL,
  `pPic` varchar(100) DEFAULT NULL,
  `pDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `catId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `posts`:
--   `catId`
--       `categories` -> `cid`
--   `userId`
--       `user` -> `id`
--

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`pid`, `pTitle`, `pContent`, `pCode`, `pPic`, `pDate`, `catId`, `userId`) VALUES
(1, 'Introduction to Java Multithreading', 'Java Multithreading is an essential topic in the Java programming language. It refers to the ability of a program to execute multiple threads in parallel, allowing for more efficient use of system resources and a smoother user experience.\r\n\r\nIn this post, we will explore the basics of Java Multithreading, including creating and executing threads, synchronization, and thread management.\r\n\r\nTo create a thread in Java, you can either extend the Thread class or implement the Runnable interface. The latter is considered a more flexible approach as it allows you to extend other classes. To execute a thread, simply call its start() method.\r\n\r\nSynchronization is an important aspect of multithreading. It ensures that multiple threads do not access and modify shared resources simultaneously, avoiding race conditions and other unpredictable behavior. This can be achieved through the use of synchronized methods or blocks.\r\n\r\nFinally, we will discuss thread management, which involves starting, stopping, and controlling threads. This is important to ensure that your program remains responsive and efficient.\r\n\r\nIn conclusion, Java Multithreading is a crucial aspect of Java programming and essential for developing high-performance, scalable, and responsive applications. With a strong understanding of the concepts outlined in this post, you can take your Java skills to the next level and build truly innovative applications.', '', 'multithreading-in-java-programming-intro.jpg', '2023-02-10 14:11:30', 1, 3),
(2, ' Understanding Python Decorators', 'Python Decorators are a powerful feature of the Python programming language that allow you to modify the behavior of a function or class. They are essentially a way of wrapping a piece of code around another piece of code, providing additional functionality or modifying existing functionality.\r\n\r\nIn this post, we will explore the basics of Python Decorators, including what they are, how they work, and how to use them effectively.\r\n\r\nPython Decorators are defined using the @ symbol, followed by the name of the decorator function. A decorator function takes a function as its input, and returns a modified version of that function. Decorators can be used to modify the behavior of a function or class, adding or modifying attributes, or even completely replacing the original functionality.\r\n\r\nOne of the main benefits of using decorators is that they allow you to write reusable code that can be applied to multiple functions or classes. For example, you can write a decorator that adds logging functionality to a function, or one that adds authentication and authorization to a class.\r\n\r\nDecorators can also be stacked, allowing you to apply multiple decorators to the same function or class. This can be useful for adding multiple layers of functionality or modifying existing functionality in multiple ways.\r\n\r\nIn conclusion, Python Decorators are a valuable tool for any Python programmer, allowing you to write more flexible, reusable, and maintainable code. With a solid understanding of how decorators work, you can take your Python skills to the next level and create truly innovative applications.', '', 'Decorator-in-Python.jpg', '2023-02-10 14:15:24', 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `about` varchar(1000) NOT NULL DEFAULT 'Hey I''am using Blogspot',
  `rdate` timestamp NULL DEFAULT current_timestamp(),
  `profile` varchar(100) NOT NULL DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `user`:
--

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `gender`, `about`, `rdate`, `profile`) VALUES
(1, 'karim', 'karim@gmail.com', '1234', 'M', 'Hey I\'am using Blogspot', '2023-02-10 11:06:26', 'default.png'),
(3, 'John Doe', 'johndoe@email.com', 'password1', 'Male', 'Software Engineer', '2023-02-10 14:05:17', 'default.png'),
(4, 'elizabeth Doe', 'elizabethdoe@email.com', 'password2', 'Female', 'Web Developer', '2023-02-10 14:05:17', 'default.png'),
(5, 'Tom Smith', 'tomsmith@email.com', 'password3', 'Male', 'Data Scientist', '2023-02-10 14:05:17', 'default.png'),
(6, 'Emily Davis', 'emilydavis@email.com', 'password4', 'Female', 'Product Manager', '2023-02-10 14:05:17', 'default.png'),
(7, 'Michael Johnson', 'michaeljohnson@email.com', 'password5', 'Male', 'UX Designer', '2023-02-10 14:05:17', 'default.png'),
(8, 'Sarah Wilson', 'sarahwilson@email.com', 'password6', 'Female', 'DevOps Engineer', '2023-02-10 14:05:17', 'default.png'),
(9, 'David Brown', 'davidbrown@email.com', 'password7', 'Male', 'Full Stack Developer', '2023-02-10 14:05:17', 'default.png'),
(10, 'Emily Chen', 'emilychen@email.com', 'password8', 'Female', 'Project Manager', '2023-02-10 14:05:17', 'default.png'),
(11, 'William Davis', 'williamdavis@email.com', 'password9', 'Male', 'Quality Assurance Engineer', '2023-02-10 14:05:17', 'default.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `liked`
--
ALTER TABLE `liked`
  ADD PRIMARY KEY (`lid`),
  ADD UNIQUE KEY `unique_index` (`pid`,`uid`),
  ADD KEY `postsliked` (`pid`) USING BTREE,
  ADD KEY `userliked` (`uid`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `postUser` (`userId`),
  ADD KEY `postCat` (`catId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `liked`
--
ALTER TABLE `liked`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `liked`
--
ALTER TABLE `liked`
  ADD CONSTRAINT `postsliked` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `userliked` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `postCat` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`),
  ADD CONSTRAINT `postUser` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

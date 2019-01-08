-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2019 at 02:13 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `animelist`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `photos` text NOT NULL,
  `joined_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('user','administrator') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`email`, `name`, `photos`, `joined_at`, `status`) VALUES
('a2.1700029@mhs.stmik-sumedang.ac.id', 'Dede Fuji Abdul', 'https://lh3.googleusercontent.com/a-/AN66SAzfmq_tD2U5vaKR6A8j9pzsbirpQFBl_4GR6iS8', '2018-12-29 08:44:26', 'user'),
('a2.1700068@mhs.stmik-sumedang.ac.id', 'Ihsan Budiman', '', '2018-12-29 09:21:18', 'user'),
('cingcaubalap@gmail.com', 'Wisnu Hidayat', 'https://lh6.googleusercontent.com/-Itr4l_sT4eA/AAAAAAAAAAI/AAAAAAAAAFI/cFEzSnN4KOc/photo.jpg', '2018-12-31 04:42:03', 'user'),
('defuj.albaihaqi17@gmail.com', 'dede puji al-baihaqi', 'https://lh3.googleusercontent.com/a-/AN66SAwXKimlnBUJX_IWuROm1k_LfMCrA1f1noSDftcX', '2018-12-29 08:02:50', 'user'),
('defuj.official@gmail.com', 'defuj official', 'https://lh3.googleusercontent.com/a-/AN66SAzoPT9OLBw8nxt3Imz5N0L1iXLHLqVtSPiwe1RsAw', '2018-12-22 07:20:54', 'administrator'),
('fahmi.ami227@gmail.com', 'Fahmi M Anshory', 'https://lh3.googleusercontent.com/a-/AAuE7mAewAUPJZCdKlIn_ED1daOtteCkUnttJitJmrYE-w', '2018-12-22 07:28:00', 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `anime`
--

CREATE TABLE `anime` (
  `id_anime` varchar(11) NOT NULL,
  `id_studio` varchar(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `synopsis` text NOT NULL,
  `type` enum('TV','OVA','ONA','Special','Movie') NOT NULL,
  `episodes` int(3) NOT NULL,
  `status` enum('Currently Airing','Finished Airing','Not Yet Aired') NOT NULL DEFAULT 'Not Yet Aired',
  `release_date` date NOT NULL,
  `premiered` enum('Winter','Summer','Spring','Fall') NOT NULL,
  `premiered_year` int(4) NOT NULL,
  `source` enum('Manga','Novel','Light Novel','Original','Visual Novel','Game','4-koma manga') NOT NULL,
  `score` float NOT NULL,
  `cover` text NOT NULL,
  `view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anime`
--

INSERT INTO `anime` (`id_anime`, `id_studio`, `title`, `synopsis`, `type`, `episodes`, `status`, `release_date`, `premiered`, `premiered_year`, `source`, `score`, `cover`, `view`) VALUES
('AW529076359', 'OY28ZDFCTS', 'Accel World', 'Haruyuki Arita is an overweight, bullied middle schooler who finds solace in playing online games. But his life takes a drastic turn one day, when he finds that all his high scores have been topped by Kuroyukihime, the popular vice president of the student council. She then invites him to the student lounge and introduces him to "Brain Burst," a program which allows the users to accelerate their brain waves to the point where time seems to stop. Brain Burst also functions as an augmented reality fighting game, and in order to get more points to accelerate, users must win duels against other players. However, if a user loses all their points, they will also lose access to Brain Burst forever. Kuroyukihime explains that she chose to show Haruyuki the program because she needs his help. She wants to meet the creator of Brain Burst and uncover the reason of why it was created, but that''s easier said than done; to do so, she must defeat the "Six Kings of Pure Color," powerful faction leaders within the game, and reach level 10, the highest level attainable. After the girl helps Haruyuki overcome the bullies that torment him, he vows to help her realize her goal, and so begins the duo''s fight to reach the top.', 'TV', 24, 'Finished Airing', '2012-04-07', 'Spring', 2012, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/8/38155.jpg', 79),
('BG476563695', 'DT33TXYVOV', 'Hakumei to Mikochi: Neji to Bed to Irori to Bakuch', 'Special episode included in the second Blu-ray/DVD volume.', 'Special', 1, 'Finished Airing', '0000-00-00', '', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/5/90014.jpg', 28),
('BL638241547', 'VN83CWCZIH', 'Amagi Brilliant Park: Wakuwaku Mini Theater - Raku', 'Mini-theater specials bundled with Blu-ray/DVD volumes of Amagi Brilliant Park.', 'Special', 7, 'Finished Airing', '2014-12-26', '', 2014, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/4/72011.jpg', 9),
('BT463199167', 'NV40ZOPHFQ', 'Angel Beats!', 'Otonashi awakens only to learn he is dead. A rifle-toting girl named Yuri explains that they are in the afterlife, and Otonashi realizes the only thing he can remember about himself is his name. Yuri tells him that she leads the Shinda Sekai Sensen (Afterlife Battlefront) and wages war against a girl named Tenshi. Unable to believe Yuri''s claims that Tenshi is evil, Otonashi attempts to speak with her, but the encounter doesn''t go as he intended. Otonashi decides to join the SSS and battle Tenshi, but he finds himself oddly drawn to her. While trying to regain his memories and understand Tenshi, he gradually unravels the mysteries of the afterlife.', 'TV', 13, 'Finished Airing', '2010-03-04', 'Spring', 2010, 'Original', 0, 'http://cdn.myanimelist.net/images/anime/10/22061.jpg', 9),
('BW855116302', 'LW13WZYKJS', 'Sword Art Online: Alicization', '"Where...am I...?" Before he knows it, Kirito has made a full-dive into an epic, fantasy-like virtual world. With only a murky recollection of what happened right before he logged in, he starts to wander around, searching for clues. He comes upon an enormous, pitch dark tree (the Gigas Cedar), where he encounters a boy. "My name is Eugeo. Nice to meet you, Kirito." Although he is supposedly a resident of the virtual world ? an NPC ? the boy shows the same array of emotions as any human being. As Kirito bonds with Eugeo, he continues to search for a way to log out of this world. Meanwhile, he remembers a certain memory deep down within him. He remembers racing through the mountains with Eugeo as a child... A memory that he should not have in the first place. And in this memory, he sees someone other than Eugeo, a young blond girl. Her name is Alice. And it is a name that must never be forgotten...', 'TV', 0, 'Finished Airing', '2018-07-10', 'Fall', 2018, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/1993/93837.jpg', 4),
('DL561853507', 'LW13WZYKJS', 'Brotherhood: Final Fantasy XV', 'Crown Prince of the Kingdom of Lucis, Noctis Lucis Caelum, sets out on a journey to Caem. His purpose is to meet with Lunafreya Nox Fleuret, an oracle and Noctis'' childhood friend, in order to marry her. A strong and silent type, Noctis is accompanied by his friends and Royal Guard Gladiolus, Prompto, and Ignis. The four young men set out on a road trip across the continent in the king''s personal convertible, the Regalia. Along the journey, each of them experience various situations which allow them to reflect on their past together, and strengthen their bonds for the future. A prequel to the 2016 video game Final Fantasy XV, Brotherhood: Final Fantasy XV explores the relationships of its four main protagonists and the challenges awaiting them.', 'ONA', 5, 'Finished Airing', '2016-03-31', '', 2016, 'Game', 0, 'http://cdn.myanimelist.net/images/anime/13/79397.jpg', 10),
('ES781256931', 'OY28ZDFCTS', 'Accel World : Infinite?Burst', 'In 2046, many aspects of life are carried out on a virtual network. No matter how advanced the time becomes, however, bullying never disappears. Haruyuki is one of the bullied students. However, one day he is contacted by Kuroyukihime, the most famous person in the school. "Wouldn''t you like to ''accelerate'' and go further ahead, boy?" Haruyuki is introduced to the "Accel World" and decides to fight as Kuroyukihime''s knight.', 'Movie', 1, 'Finished Airing', '2016-07-23', '', 2016, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/5/87145.jpg', 4),
('EZ436837556', 'OX47ZCQHDX', 'Boku no Hero Academia: Sukue! Kyuujo Kunren!', 'UA High School must regain the public''s confidence after the surprise villain attack during class 1-A''s training session. Although some of the teachers were gravely injured in the attack, Izuku "Deku" Midoriya and his classmates must continue to learn and train, and utilize their quirks in varying environments and circumstances. Boku no Hero Academia: Sukue! Kyuujo Kunren! follows class 1-A as they attempt to finally complete their training. However, there''s a masked figure roaming around the training center. Have the villains responsible for the previous incident returned to finish the job? If so, are the students ready to fight back?', 'OVA', 1, 'Finished Airing', '2017-04-04', '', 2017, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/5/83988.jpg', 0),
('EZ892314843', 'TR97DRJPNN', 'Gabriel DropOut', 'For centuries, Heaven has required its young angels to live and study among humans in order to become full-fledged angels. This is no different for top-of-her-class Gabriel White Tenma, who believes it is her mission to be a great angel who will bring happiness to mankind. However, Gabriel grows addicted to video games on Earth and eventually becomes a hikikomori. Proclaiming herself a "Faillen Angel," she is apathetic to everything else?much to the annoyance of Vignette April Tsukinose, a demon whom Gabriel befriended in her angelic early days on Earth. Vignette''s attempts to revert Gabriel back to her previous self are in vain, as Gabriel shoots down any attempt to change her precious lifestyle. As they spend their time on Earth, they meet two eccentric personalities: the angel Raphiel Ainsworth Shiraha, Gabriel''s classmate with a penchant for sadism, and the demon Satanichia McDowell Kurumizawa, a clumsy self-proclaimed future ruler of the Underworld.', 'TV', 12, 'Finished Airing', '2017-09-01', 'Winter', 2017, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/9/82590.jpg', 0),
('FJ443443109', 'OX47ZCQHDX', 'Boku no Hero Academia 3rd Season', 'Third season of Boku no Hero Academia, covering the Forest Training Camp Arc, Hideout Raid Arc and the Provisional Hero License Exam Arc.', 'TV', 25, 'Finished Airing', '2018-07-04', 'Spring', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1319/92084.jpg', 0),
('FZ668419191', 'DT33TXYVOV', 'Asobi Asobase', 'Hanako, an athletically proficient, yet thick-headed student with a weird fashion sense, plays a game with the American transfer student Olivia. However, their vigor irritated their classmate Kasumi who dislikes playing games since she has always been teased by her sister for being bad at them. With a turn of events, it was found out that Kasumi is terrible at English. Thus, she asked her foreign classmate Olivia to help her, but Olivia, who is only born and raised in Japan with foreign parents, can''t actually speak English at all! Watch over these three girls'' surreal school-life comedy.', 'TV', 12, 'Finished Airing', '2018-08-07', 'Summer', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1139/95077.jpg', 0),
('GA176913824', 'NV40ZOPHFQ', 'Angel Beats!: Another Epilogue', 'Disillusioned with the afterlife, a new student causes a scene during a classroom test and expresses his doubts about whether getting good grades can really lead to escaping the school and ascending to Heaven. Afterwards, he is confronted by the new student council president?a familiar face whose past experiences give him powerful insight into the true nature of the school and first-hand knowledge regarding the futility of rebellion.', 'Special', 1, 'Finished Airing', '2010-12-22', '', 2010, 'Original', 0, 'http://cdn.myanimelist.net/images/anime/4/65355.jpg', 0),
('GB599198257', 'TR97DRJPNN', 'Himouto! Umaru-chan OVA', 'Episodes included in the manga''s seventh and tenth volumes', 'OVA', 2, 'Finished Airing', '0000-00-00', '', 2015, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/7/76826.jpg', 0),
('GK167364476', 'NV40ZOPHFQ', 'Another', 'In 1972, a popular student in Yomiyama North Middle School''s class 3-3 named Misaki passed away during the school year. Since then, the town of Yomiyama has been shrouded by a fearful atmosphere, from the dark secrets hidden deep within. Twenty-six years later, 15-year-old Kouichi Sakakibara transfers into class 3-3 of Yomiyama North and soon after discovers that a strange, gloomy mood seems to hang over all the students. He also finds himself drawn to the mysterious, eyepatch-wearing student Mei Misaki; however, the rest of the class and the teachers seem to treat her like she doesn''t exist. Paying no heed to warnings from everyone including Mei herself, Kouichi begins to get closer not only to her, but also to the truth behind the gruesome phenomenon plaguing class 3-3 of Yomiyama North. Another follows Kouichi, Mei, and their classmates as they are pulled into the enigma surrounding a series of inevitable, tragic events?but unraveling the horror of Yomiyama may just cost them the ultimate price', 'TV', 12, 'Finished Airing', '2012-01-10', 'Winter', 2012, 'Novel', 0, 'http://cdn.myanimelist.net/images/anime/4/75509.jpg', 0),
('GT568980584', 'OX47ZCQHDX', 'Boku no Hero Academia: All Might - Rising The Anim', 'Short Special included with the Blu-ray/DVD release of Boku no Hero Academia the Movie: Futari no Hero.', 'Special', 1, 'Not Yet Aired', '2019-02-13', '', 2019, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1420/96793.jpg', 10),
('GX348544548', 'FP39DRQVWZ', 'Gegege no Kitarou (2018)', 'Nearly twenty years into the 21st century, people have forgotten the existence of youkai. When a number of unexplainable phenomena plague adults of the human world with confusion and chaos, thirteen-year-old Mana writes a letter to the Youkai Post in search of answers, only to be greeted by Gegege no Kitarou...', 'TV', 0, 'Currently Airing', '2018-01-04', 'Spring', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1273/93610.jpg', 17),
('HH453875635', 'GWT4G9AWE3U', 'Akame ga Kill!', 'Night Raid is the covert assassination branch of the Revolutionary Army, an uprising assembled to overthrow Prime Minister Honest, whose avarice and greed for power has lead him to take advantage of the child emperor''s inexperience. Without a strong and benevolent leader, the rest of the nation is left to drown in poverty, strife, and ruin. Though the Night Raid members are all experienced killers, they understand that taking lives is far from commendable and that they will likely face retribution as they mercilessly eliminate anyone who stands in the revolution''s way. This merry band of assassins'' newest member is Tatsumi, a na?ve boy from a remote village who had embarked on a journey to help his impoverished hometown and was won over by not only Night Raid''s ideals, but also their resolve. Akame ga Kill! follows Tatsumi as he fights the Empire and comes face-to-face with powerful weapons, enemy assassins, challenges to his own morals and values, and ultimately, what it truly means to be an assassin with a cause.', 'TV', 24, 'Finished Airing', '2014-07-07', 'Summer', 2014, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1429/95946.jpg', 0),
('HQ617469312', 'MSJ68DL8F5A', 'Tensei shitara Slime Datta Ken', '"Rimuru Tempest" is the new name of a slime in a fantasy world taken by a former 37-year-old human Satoru Mikami after he is killed by a passing robber. Broken free from ordinary, stale past life, his fresh adventure in a fantasy world as a slime monster with unique abilities begins.', 'TV', 24, 'Currently Airing', '2018-02-10', 'Fall', 2018, 'Manga', 0, 'http://myanimelist.cdn-dena.com/images/anime/1694/93337.jpg', 87),
('HY199590692', 'A2JG8SN628', 'Akame ga Kill! Theater', 'Short specials that aired on the official website.', 'ONA', 24, 'Finished Airing', '2014-08-07', '', 2014, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/6/64537.jpg', 1),
('IP193854877', 'RO15MFHQKD', 'Accel World : Acchel World.', 'Spin-off of?Accel World?included on the anime Blu-ray/DVDs.', 'Special', 8, 'Finished Airing', '2013-07-25', '', 2012, '4-koma manga', 0, 'http://cdn.myanimelist.net/images/anime/10/38469.jpg', 1),
('JI663748732', 'TR97DRJPNN', 'Gabriel DropOut Specials', 'Specials included with the Blu-ray/DVD release of Gabriel DropOut', 'Special', 2, 'Finished Airing', '0000-00-00', '', 2017, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/8/89690.jpg', 0),
('KA268245653', 'VN83CWCZIH', 'Amagi Brilliant Park', 'Kanie Seiya, a smart and extremely narcissistic high school student, believes that the beautiful but reserved Sento Isuzu has invited him on a date at an amusement park called Amagi Brilliant Park. Much to his chagrin, not only is the location a run-down facility, the supposed date is merely a recruitment tour where Sento and Princess Latifa Fleuranza, the owner of the theme park, ask him to become the park''s new manager. Their cause for desperation? As stipulated in a land-use contract, Amagi has less than three months to meet a quota of 500,000 guests, or the park will be closed for good and the land redeveloped by a greedy real-estate company. Seiya is won over by the revelation that Amagi is no ordinary amusement park; many of its employees are Maple Landers?mysterious magical beings who live in the human world and are nourished by the energy created by people having fun. Entrusted with the hopes and dreams of this far-off enchanted land, Seiya must now use his many skills to bring Amagi back on its feet, or watch it crumble before his eyes.', 'TV', 13, 'Finished Airing', '2014-07-10', 'Fall', 2014, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/5/85435.jpg', 0),
('KD528760543', 'KT26783RGB', 'Hataraku Saibou', 'This is a story about you. A tale about the inside of your body... According to a new study, the human body consists of approximately 37 trillion cells. These cells are hard at work every day within a world that is your body. From the oxygen-carrying red blood cells to the bacteria-fighting white blood cells, get to know the unsung heroes and the drama that unfolds inside of you! It''s the oddly relatable and interesting story that is the life of cells!', 'TV', 13, 'Finished Airing', '2018-08-07', 'Summer', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1270/95221.jpg', 0),
('KM744278711', 'TR97DRJPNN', 'Himouto! Umaru-chan', 'People are not always who they appear to be, as is the case with Umaru Doma, the perfect high school girl?that is, until she gets home! Once the front door closes, the real fun begins. When she dons her hamster hoodie, she transforms from a refined, over-achieving student into a lazy, junk food-eating otaku, leaving all the housework to her responsible older brother Taihei. Whether she''s hanging out with her friends Nana Ebina and Kirie Motoba, or competing with her self-proclaimed "rival" Sylphinford Tachibana, Umaru knows how to kick back and have some fun! Himouto! Umaru-chan is a cute story that follows the daily adventures of Umaru and Taihei, as they take care of?and put up with?each other the best they can, as well as the unbreakable bonds between friends and siblings.', 'TV', 12, 'Finished Airing', '0000-00-00', 'Summer', 2015, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/12/75086.jpg', 73),
('KP798279595', 'YD73IMYLSN', 'Grand Blue', 'Among the seaside town of Izu''s ocean waves and rays of shining sun, Iori Kitahara is just beginning his freshman year at Izu University. As he moves into his uncle''s scuba diving shop, Grand Blue, he eagerly anticipates his dream college life, filled with beautiful girls and good friends. But things don''t exactly go according to plan. Upon entering the shop, he encounters a group of rowdy, naked upperclassmen, who immediately coerce him into participating in their alcoholic activities. Though unwilling at first, Iori quickly gives in and becomes the heart and soul of the party. Unfortunately, this earns him the scorn of his cousin, Chisa Kotegawa, who walks in at precisely the wrong time. Undeterred, Iori still vows to realize his ideal college life, but will things go according to plan this time, or will his situation take yet another dive?', 'TV', 12, 'Finished Airing', '0000-00-00', 'Summer', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1302/94882.jpg', 0),
('LP454293133', 'KT56DBBRGB', 'Jashin-chan Dropkick Episode 12', 'It was believed to be traveling in space, but, "I''m back, guys!" Due to popular demand, we decided to bring Jashin-chan back for an extra episode! What will she face when she returns to Earth? Yurine, Medusa, Pekola, Minos, Yusa, Koji and Peru-chan are all in for the "swimsuit edition"! Then appears Kraken for what seemed like the last battle of the season, but the real battle continues...', 'ONA', 1, 'Finished Airing', '2018-01-10', '', 2018, '', 0, 'http://cdn.myanimelist.net/images/anime/1892/93420.jpg', 0),
('LT455319659', 'ZM90RZUOMJ', 'God Eater', 'The year is 2071. Humanity has been pushed to the brink of extinction following the emergence of man-eating monsters called "Aragami" that boast an immunity to conventional weaponry. They ravaged the land, consuming almost everything in their path and leaving nothing in their wake. To combat them, an organization named Fenrir was formed as a last-ditch effort to save humanity through the use of "God Eaters"?special humans infused with Oracle cells, allowing them to wield the God Arc, the only known weapon capable of killing an Aragami. One such God Eater is Lenka Utsugi, a New-Type whose God Arc takes the form of both blade and gun. Now, as one of Fenrir''s greatest weapons, Lenka must master his God Arc if he is to fulfill his desire of wiping out the Aragami once and for all. The monsters continue to be born en masse while the remnants of humanity struggle to survive the night. Only God Eaters stand between the Aragami and complete and total annihilation of the human race.', 'TV', 13, 'Finished Airing', '2015-12-07', 'Summer', 2015, 'Game', 0, 'http://cdn.myanimelist.net/images/anime/7/73852.jpg', 0),
('LU817744129', 'YD86XROYGL', 'Ingress the Animation', 'A project was launched where scientists discovered a mysterious substance that can interface directly with the human brain. This substance, called "Exotic Matter (XM)," has existed since ancient times, influencing human minds and the progress of humanity. In the wake of this discovery, a battle of powerful nations and corporate giants has been unleashed. Organizations across the globe have embarked on a secret race to exploit XM. It represents both an opportunity and a threat to humanity. Two Factions seeks to control the XM. The Enlightened view XM''s power as a gift that enhances human experience and discovery. The Resistance sees XM as a hostile takeover of the human mind, choosing technology as humanity''s best path forward. XM, and the mystery behind it lie at the center of this battle for the fate of humanity. 2018?Now, a new struggle is about to unfold in Tokyo and across the globe. Dangerous and powerful forces seeking to exploit the potential of XM will collide. This groundbreaking project will mark the beginning of an epic augmented-reality experience combining the three elements of animation, location-based gaming, and the real world.', 'ONA', 11, 'Finished Airing', '2018-08-11', '', 2018, 'Game', 0, 'http://cdn.myanimelist.net/images/anime/1944/93421.jpg', 0),
('LX424387737', 'LL19NXHUFF', 'Happy Sugar Life', 'This is a shivering pure love psycho horror story of a girl named Satou Matsuzaka, who has someone she likes. She experiences a sweet feeling when she encounters her, and thought it must be love. Everything will be forgiven as long as she protects this feeling, even if she tricks, commits crimes, steals, or even kills, she thought.', 'TV', 12, 'Finished Airing', '0000-00-00', 'Summer', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1086/91313.jpg', 0),
('NA398843618', 'OX47ZCQHDX', 'Boku no Hero Academia: Training of the Dead', 'OVA bundled with the 14th manga volume. Story about a joint practice session between Izuku''s class and Isami High students at Yuuei Academy, takes place after the field training arc in the second season.', 'OVA', 1, 'Finished Airing', '2017-02-06', '', 2017, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/2/85465.jpg', 0),
('OD936793208', 'OY28ZDFCTS', 'Accel World EX', 'OVA bundled with the?Accel World?simulation and action games. The Blu-ray OVA discs came with the PS3 limited edition versions and the DVD with the PSP limited edition versions.', 'OVA', 2, 'Finished Airing', '2012-09-13', '', 2012, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/10/41815.jpg', 0),
('PA201220106', 'IL36NJRFKF', 'Black Bullet', 'In the year 2021, a parasitic virus known as "Gastrea" infects humans and turns them into monsters. What is left of mankind now lives within the Monolith walls, walls that are made of Varanium, the only material that can hurt Gastrea. To counter the threat that the Gastrea pose, "Cursed Children"?female children whose bodies contain trace amounts of the virus which grant them superhuman abilities?officially called Initiators by the Tendo Civil Security, are given partners called Promoters, people who work to guide and protect the young Initiators. These teams of two are sent out on missions to fight the monsters created by the Gastrea virus and keep them at bay. Black Bullet revolves around the team of Enju Aihara, an Initiator, and Satomi Rentaro, a Promoter, as they go on missions to fight the growing threat of Gastrea in their hometown of Tokyo.', 'TV', 13, 'Finished Airing', '2014-08-04', '', 2014, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/6/57947.jpg', 0),
('PI874614529', 'OV25OUGPEA', 'Isekai Shokudou', 'Western Restaurant Nekoya is a popular eatery located on a street corner in a Tokyo shopping district. Serving both traditional Japanese fare as well as Western dishes, this eating establishment is popular among Tokyo''s residents. But this seemingly ordinary restaurant is also popular with another type of clientele... While the restaurant is thought to be closed on Saturdays, the truth is that on this special day each week, its doors are instead opened to the inhabitants of other worlds. From dragons and elves to fairies and mages, this restaurant has no shortage of strange customers. Nevertheless, the enigmatic chef known only as "Master" will be waiting to serve up their favorite dishes with a kind smile and keep them coming back for many more Saturdays to come.', 'TV', 12, 'Finished Airing', '2017-04-07', 'Summer', 2017, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/3/86666.jpg', 0),
('PV211298559', 'NV40ZOPHFQ', 'Boku dake ga inai Machi', 'When tragedy is about to strike, Satoru Fujinuma finds himself sent back several minutes before the accident occurs. The detached, 29-year-old manga artist has taken advantage of this powerful yet mysterious phenomenon, which he calls "Revival," to save many lives. However, when he is wrongfully accused of murdering someone close to him, Satoru is sent back to the past once again, but this time to 1988, 18 years in the past. Soon, he realizes that the murder may be connected to the abduction and killing of one of his classmates, the solitary and mysterious Kayo Hinazuki, that took place when he was a child. This is his chance to make things right. Boku dake ga Inai Machi follows Satoru in his mission to uncover what truly transpired 18 years ago and prevent the death of his classmate while protecting those he cares about in the present.', 'TV', 12, 'Finished Airing', '2016-08-01', 'Winter', 2016, 'Manga', 0, 'http://cdn.myanimelist.net/images/manga/1/172082.jpg', 0),
('QA314918532', 'DT33TXYVOV', 'Asobi Asobase Specials', 'Included with the third and fourth volumes of the Asobi Asobase Blu-ray and DVD releases.', 'Special', 2, 'Finished Airing', '2018-11-28', '', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1270/97437.jpg', 0),
('QP503445933', 'OX47ZCQHDX', 'Boku no Hero Academia 2nd Season', 'At UA Academy, not even a violent attack can disrupt their most prestigious event: the school sports festival. Renowned across Japan, this festival is an opportunity for aspiring heroes to showcase their abilities, both to the public and potential recruiters. However, the path to glory is never easy, especially for Izuku Midoriya?whose quirk possesses great raw power but is also cripplingly inefficient. Pitted against his talented classmates, such as the fire and ice wielding Shouto Todoroki, Izuku must utilize his sharp wits and master his surroundings to achieve victory and prove to the world his worth.', 'TV', 25, 'Finished Airing', '2017-01-04', 'Spring', 2017, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/12/85221.jpg', 0),
('RC455195113', 'GC76XTQCRR', 'Island', 'Urashima, an island far from the mainland. The people who live there lead carefree lives. But five years ago, the island''s three great families suffered a series of misfortunes and succumbed to suspicion. The people of the island cut off all contact with the mainland and began a slow decline. The key to saving the island lies in three girls who belong to the three families. But they are bound by old traditions, and are conflicted. On that island, a lone man washes ashore. The man claims to be from the future, and he begins a solitary struggle to change the island''s fate.', 'TV', 12, 'Finished Airing', '2018-01-07', 'Summer', 2018, 'Visual Novel', 0, 'http://cdn.myanimelist.net/images/anime/1951/95080.jpg', 0),
('RE741557849', 'T3SIB24AX66', 'Seishun Buta Yarou wa Bunny Girl Senpai no Yume wo', 'This year, Sakuta Azusagawa, a second-year student at a high school near Enoshima, meets several girls that are experiencing this "puberty syndrome." For instance, he meets a wild bunny girl in the library. She turns out to be an actress on hiatus, Mai Sakurajima, who is also his senior at the school. For some reason, no one else can see this enchanting girl. How did she become invisible...? As Sakuta searches for answers to help Mai, they spend more time together, and he eventually learns of her hidden feelings...', 'TV', 13, 'Currently Airing', '2018-04-10', 'Fall', 2018, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/1301/93586.jpg', 12),
('RK395361869', 'DT33TXYVOV', 'Asobi Asobase OVA', 'Included with seventh volume of the Asobi Asobase manga.', 'OVA', 1, 'Not Yet Aired', '2018-12-26', '', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1504/93196.jpg', 3),
('SN236188137', 'OX47ZCQHDX', 'Boku no Hero Academia 4th Season', 'Fourth season of Boku no Hero Academia.', 'TV', 0, 'Not Yet Aired', '0000-00-00', 'Fall', 2019, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1251/97634.jpg', 1),
('ST772811339', 'TR97DRJPNN', 'Himouto! Umaru-chan R', 'Umaru Doma is a model student who has a hidden side: when she gets home each day, she puts on her hamster hoodie and turns into a sluggish otaku fond of junk food. As Umaru continues these daily antics, the friendship between her and her classmates?Nana Ebina, Kirie Motoba, and Sylphinford Tachibana?deepens, and more and more interesting events begin to unfold. Of course, these events give rise to numerous questions. What did Nana ask of Umaru''s brother Taihei? Who is the mysterious girl with the diamond hairpin? And most important of all: why does this girl seem to know Umaru? These questions and more will be answered in Himouto! Umaru-chan R!', 'TV', 12, 'Finished Airing', '2017-08-10', 'Fall', 2017, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/10/89671.jpg', 0),
('TA929064175', 'OY28ZDFCTS', 'Binbougami ga!', 'Ichiko Sakura lives life on easy mode. Blessed with good fortune, she has everything she has ever wanted, including beauty, intelligence, and wealth. Momiji Binboda is a goddess of poverty. In stark contrast to Ichiko, she is cursed with misfortune, such as a perpetual cast on her arm, a flat chest, and a box under a bridge for a home. Their lives collide when Momiji lives up to her title and delivers some unfortunate news to Ichiko: her large amount of luck is due to her subconsciously draining the luck from those around her! Momiji has been tasked with stealing back Ichiko''s fortune before she leaves everyone without enough luck to even survive. But Ichiko, with the help of the wandering monk Bobby Statice, manages to fight off the poverty goddess. This defeat forces the goddess to enlist reinforcements in the form of Kumagai, her teddy bear familiar, and the masochistic dog god, Momoo Inugami. Insanity ensues as Ichiko''s quiet life is replaced with daily battles for her fortune. To survive the chaos, Ichiko will need all the luck she can get in Binbougami ga!!', 'TV', 13, 'Finished Airing', '2012-05-07', 'Summer', 2012, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/8/39333.jpg', 0),
('TM584122362', 'GWT4G9AWE3U', 'Goblin Slayer', 'A young priestess has formed her first adventuring party, but almost immediately they find themselves in distress. It''s the Goblin Slayer who comes to their rescue?a man who''s dedicated his life to the extermination of all goblins, by any means necessary. And when rumors of his feats begin to circulate, there''s no telling who might come calling next...', 'TV', 12, 'Currently Airing', '2018-07-10', 'Fall', 2018, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/1949/93415.jpg', 6),
('UT167841886', 'KT56DBBRGB', 'Jashin-chan Dropkick', 'Jashin-chan, a devil from Hell was abruptly summoned to the human world by Yurine Hanazono, a stoic college student who lives in a run-down apartment in Jinbocho. They''re forced to become roommates since Yurine doesn''t know how to send Jashin-chan back. But according to Jashin-chan, she could return by killing Yurine, so she takes action...?! A viperous roomie comedy that keeps you on your toes!', 'TV', 11, 'Finished Airing', '2018-10-07', 'Summer', 2018, '', 0, 'http://cdn.myanimelist.net/images/anime/1892/93420.jpg', 0),
('UU229916249', 'NV40ZOPHFQ', 'Angel Beats! Specials', 'Unaired episodes of Angel Beats! included in the seventh volume of the Blu-ray and DVD, and another included in the Blu-ray Box', 'Special', 2, 'Finished Airing', '2010-12-22', '', 2010, 'Original', 0, 'http://cdn.myanimelist.net/images/anime/4/25073.jpg', 0),
('VZ451843512', 'NV40ZOPHFQ', 'Another: The Other', 'Set before the beginning of the story, called the "0th episode" and also "The Other". The OVA shows the stories between Mei Misaki and her twin, Misaki Fujioka, sometime prior to the start of the anime.', 'OVA', 1, 'Finished Airing', '2012-05-26', '', 2012, 'Novel', 0, 'http://cdn.myanimelist.net/images/anime/9/42051.jpg', 0),
('WH641918874', 'VN83CWCZIH', 'Amagi Brilliant Park: Nonbirishiteiru Hima ga Nai!', 'Unaired episode bundled with the seventh Blu-ray and DVD volume of Amagi Brilliant Park.', 'Special', 1, 'Finished Airing', '2015-06-26', '', 2015, 'Light Novel', 0, 'http://cdn.myanimelist.net/images/anime/11/74772.jpg', 0),
('XB209956487', 'DT33TXYVOV', 'Gakkougurashi!', 'Yuki Takeya loves her school so much that she does not want to ever leave! Megurigaoka High School is a unique and lively place where Yuki enjoys her carefree life as a third-year high school student and member of the School Living Club. The club, consisting of the president Yuuri Wakasa, the athletic Kurumi Ebisuzawa, the mature junior Miki Naoki, the supervising teacher Megumi Sakura, and the club dog Taroumaru, prides itself on making the most of life at school. However, this illusion of endless bliss is just a bubble waiting to be burst because Yuki is unable to perceive what is truly happening around her. In reality, all is not as it seems?the real purpose of the School Living Club is to escape from the shocking and disturbing truth: the girls are in the middle of a zombie apocalypse and have barricaded themselves inside the school as the sole survivors.', 'TV', 12, 'Finished Airing', '2015-09-07', 'Summer', 2015, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1798/91548.jpg', 0),
('YM225273521', 'TR97DRJPNN', 'Himouto! Umaru-chanS', 'These shorts, included in the Blu-ray and DVD releases, take place in a timeline with multiple Umaru-chans.', 'Special', 12, 'Finished Airing', '0000-00-00', '', 2015, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/13/75074.jpg', 0),
('YN715750681', 'LW13WZYKJS', 'Blend S', 'High school girl Maika Sakuranomiya has trouble finding a part-time job because of how scary she looks when smiling. However, she is scouted one day by an Italian man who is also the manager of Stile, a caf? where its waitresses are given unique traits such as tsundere and younger sister. Maika is given a sadist trait because of her looks and has to adopt a dominant and cruel persona when servicing customers, particularly masochist ones.', 'TV', 12, 'Finished Airing', '2017-08-10', 'Fall', 2017, '4-koma manga', 0, 'http://cdn.myanimelist.net/images/anime/6/88286.jpg', 0),
('YV126787408', 'DT33TXYVOV', 'Hakumei to Mikochi', 'Nine centimeters (3.5 inches) tall, tiny girls Hakumei and Mikochi live in the forest. Living in a tiny house in a tree, riding insects and birds, and making umbrellas out of leaves, these tiny girls live a tiny life. Follow their tiny but lovely lives as they live their day-to-day in a fantastic world of tiny people and gods.', 'TV', 12, 'Finished Airing', '2018-12-07', 'Winter', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1250/91694.jpg', 0),
('ZF656668161', 'QS95QKKLED', 'Aho Girl', 'Yoshiko Hanabatake is an idiot beyond all belief. Somehow managing to consistently score zeroes on all of her tests and consumed by an absurd obsession with bananas, her senseless acts have caused even her own mother to lose all hope. Only one person is up to the task of keeping her insanity in check: childhood friend Akuru "A-kun" Akutsu. Though he bemoans the ridiculous behavior he has to endure, the studious but terrifying A-kun is always ready to put an end to any stupidity Yoshiko gets up to, with no qualms about using physical force. Unfortunately, no matter how many times he attempts to knock some sense into her, the girl bounces right back to her usual shenanigans, even dragging in some other eccentrics along for the ride. Try as he might to rein in her nonsense, every moment is unpredictable with Yoshiko and her profound idiocy on the loose.', 'TV', 12, 'Finished Airing', '2017-04-07', 'Summer', 2017, '4-koma manga', 0, 'http://cdn.myanimelist.net/images/anime/7/86665.jpg', 0),
('ZF852194419', 'OX47ZCQHDX', 'Boku no Hero Academia', 'e appearance of "quirks," newly discovered super powers, has been steadily increasing over the years, with 80 percent of humanity possessing various abilities from manipulation of elements to shapeshifting. This leaves the remainder of the world completely powerless, and Izuku Midoriya is one such individual. Since he was a child, the ambitious middle schooler has wanted nothing more than to be a hero. Izuku''s unfair fate leaves him admiring heroes and taking notes on them whenever he can. But it seems that his persistence has borne some fruit: Izuku meets the number one hero and his personal idol, All Might. All Might''s quirk is a unique ability that can be inherited, and he has chosen Izuku to be his successor! Enduring many months of grueling training, Izuku enrolls in UA High, a prestigious high school famous for its excellent hero training program, and this year''s freshmen look especially promising. With his bizarre but talented classmates and the looming threat of a villainous organization, Izuku will soon learn what it really means to be a hero.', 'TV', 13, 'Finished Airing', '2016-03-04', 'Spring', 2016, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/10/78745.jpg', 0),
('ZI828366133', 'GC76XTQCRR', 'Hinamatsuri', 'One night, a strange object falls on the head of Nitta, a member of the yakuza. Inside the box is a strange young girl named Hina. She has tremendous supernatural powers, and Nitta finds himself reluctantly taking her in. Her powers can come in handy for his yakuza business, but he also runs the risk of her using them on him! Not to mention, if she doesn''t use her powers, she will eventually go berserk and destroy everything around her. Nitta and Hina''s strange life together is just beginning...', 'TV', 12, 'Finished Airing', '2018-06-04', 'Spring', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1580/93526.jpg', 0),
('ZR229999533', 'OX47ZCQHDX', 'Boku no Hero Academia the Movie: Futari no Hero', 'Deku and All Might receive an invitation to I-Expo, the world?s leading exhibition of Quirk abilities and hero item innovations! Amid the excitement, sponsors, and pros from all over, Deku meets Melissa, a girl who is Quirkless just like he once was. Suddenly, I-Expo?s top-of-the-line security system gets hacked by villains, and a sinister plan is set in motion. It?s a serious threat to hero society, and one man holds the key to it all?the symbol of peace, All Might.', 'Movie', 1, 'Finished Airing', '2018-03-08', '', 2018, 'Manga', 0, 'http://cdn.myanimelist.net/images/anime/1736/93138.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id_genres` varchar(11) NOT NULL,
  `genres` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id_genres`, `genres`) VALUES
('3S16XGQLO1Y', 'Romance'),
('AOPI3SGZBHI', 'Shounen'),
('BT93TQHROZ', 'Dementia'),
('CO69ODWVTI', 'Police'),
('CX47LSWJAB', 'Mecha'),
('CZ85TMJNZH', 'Seinen'),
('DRIW7H7BC8I', 'Adventure'),
('DU50OCBSNK', 'Ecchi'),
('DZ64EOVCNM', 'Music'),
('EJ52JUJJLN', 'Historical'),
('EK82WQKEUD', 'Shoujo'),
('GB17XCGRKD', 'Space'),
('GR83OXUNAB', 'Harem'),
('HY54PRYIHG', 'Slice of life'),
('IA47BNDUMP', 'Martial arts'),
('IG69YCHMQG', 'Horror'),
('IS16IDBWNK', 'Game'),
('IT10YLSXYT', 'Sport'),
('J551Z6XFEXK', 'Fantasy'),
('JYH8YNUNQNI', 'Supernatural'),
('MM16EKXJDS', 'Josei'),
('OQ45HCLXOU', 'Parody'),
('OY56TZWRVK', 'Samurai'),
('QT46HWRFIK', 'Psychological'),
('RV45BMDXXB', 'Sci-fi'),
('SO99RWORCM', 'Super power'),
('TH58OFKUOE', 'Kids'),
('TL96XUGHEU', 'Shounen Ai'),
('UJ22DTXUVN', 'Thriller'),
('V0Q7T71G3YQ', 'School'),
('VO30HNKAXW', 'Magic'),
('W04CN8H1CAG', 'Comedy'),
('WR31UXHXUG', 'Cars'),
('WZ41MIOFDO', 'Shoujo Ai'),
('XA39NKNKDK', 'Drama'),
('XK45OKZWDZ', 'Vampire'),
('YK55ZDMFKV', 'Military'),
('YS42RXGYML', 'Demons'),
('ZRJIBFVUJAA', 'Action'),
('ZY90ANUIIF', 'Mystery');

-- --------------------------------------------------------

--
-- Table structure for table `genres_on_anime`
--

CREATE TABLE `genres_on_anime` (
  `id_anime` varchar(11) NOT NULL,
  `id_genres` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres_on_anime`
--

INSERT INTO `genres_on_anime` (`id_anime`, `id_genres`) VALUES
('HQ617469312', 'W04CN8H1CAG'),
('HQ617469312', 'J551Z6XFEXK'),
('HQ617469312', 'VO30HNKAXW'),
('RE741557849', 'XA39NKNKDK'),
('RE741557849', 'V0Q7T71G3YQ');

-- --------------------------------------------------------

--
-- Table structure for table `myfavorites`
--

CREATE TABLE `myfavorites` (
  `email` varchar(50) NOT NULL,
  `id_anime` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myfavorites`
--

INSERT INTO `myfavorites` (`email`, `id_anime`) VALUES
('defuj.official@gmail.com', 'KM744278711'),
('defuj.official@gmail.com', 'BW855116302'),
('defuj.official@gmail.com', 'HQ617469312'),
('defuj.official@gmail.com', 'BL638241547'),
('defuj.official@gmail.com', 'BT463199167'),
('defuj.albaihaqi17@gmail.com', 'GX348544548'),
('defuj.albaihaqi17@gmail.com', 'BG476563695'),
('a2.1700029@mhs.stmik-sumedang.ac.id', 'GT568980584'),
('a2.1700029@mhs.stmik-sumedang.ac.id', 'AW529076359'),
('a2.1700029@mhs.stmik-sumedang.ac.id', 'GX348544548'),
('a2.1700029@mhs.stmik-sumedang.ac.id', 'ES781256931'),
('a2.1700029@mhs.stmik-sumedang.ac.id', 'BW855116302'),
('a2.1700029@mhs.stmik-sumedang.ac.id', 'RE741557849'),
('a2.1700068@mhs.stmik-sumedang.ac.id', 'GT568980584'),
('a2.1700068@mhs.stmik-sumedang.ac.id', 'BW855116302'),
('defuj.albaihaqi17@gmail.com', 'KM744278711'),
('defuj.albaihaqi17@gmail.com', 'HQ617469312'),
('defuj.albaihaqi17@gmail.com', 'AW529076359'),
('defuj.albaihaqi17@gmail.com', 'BT463199167'),
('fahmi.ami227@gmail.com', 'BL638241547'),
('defuj.official@gmail.com', 'AW529076359');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `email` varchar(50) NOT NULL,
  `id_anime` varchar(11) NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`email`, `id_anime`, `score`) VALUES
('defuj.albaihaqi17@gmail.com', 'DL561853507', 5),
('defuj.albaihaqi17@gmail.com', 'AW529076359', 3),
('defuj.albaihaqi17@gmail.com', 'HQ617469312', 5),
('defuj.albaihaqi17@gmail.com', 'TM584122362', 0),
('defuj.albaihaqi17@gmail.com', 'BL638241547', 4),
('defuj.albaihaqi17@gmail.com', 'BG476563695', 4),
('defuj.albaihaqi17@gmail.com', 'BT463199167', 5),
('defuj.albaihaqi17@gmail.com', 'KM744278711', 5),
('defuj.albaihaqi17@gmail.com', 'RK395361869', 2),
('defuj.albaihaqi17@gmail.com', 'SN236188137', 5),
('defuj.official@gmail.com', 'AW529076359', 4),
('fahmi.ami227@gmail.com', 'HQ617469312', 5),
('fahmi.ami227@gmail.com', 'GX348544548', 4),
('defuj.official@gmail.com', 'KM744278711', 4),
('defuj.official@gmail.com', 'GT568980584', 4),
('defuj.official@gmail.com', 'BG476563695', 5),
('defuj.official@gmail.com', 'BT463199167', 3),
('defuj.official@gmail.com', 'BL638241547', 2),
('defuj.official@gmail.com', 'HQ617469312', 5),
('defuj.official@gmail.com', 'BW855116302', 4);

-- --------------------------------------------------------

--
-- Table structure for table `studios`
--

CREATE TABLE `studios` (
  `id_studio` varchar(11) NOT NULL,
  `studio` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studios`
--

INSERT INTO `studios` (`id_studio`, `studio`) VALUES
('A2JG8SN628', 'C-Stasion'),
('DA33MXUNOE', 'Funimation'),
('DT33TXYVOV', 'Lerche'),
('FP39DRQVWZ', 'Toei Animation'),
('GC76XTQCRR', 'feel.'),
('GWT4G9AWE3U', 'White Fox'),
('IH14EYMRUA', 'Studio PuYUKAI'),
('IK44PDTLRW', 'production doA'),
('IL36NJRFKF', 'Kinema Citrus'),
('IP27KFDRID', 'Wit Studio'),
('JF85OTAZEM', 'Kamikaze Douga'),
('KT26783RGB', 'Aniplex of America'),
('KT56DBBRGB', 'Nomad'),
('LL19NXHUFF', 'Ezola'),
('LW13WZYKJS', 'A-1 Pictures'),
('MSJ68DL8F5A', '8bit'),
('NV40ZOPHFQ', 'P.A. Works'),
('OG33EQCTKL', 'Studio Pierrot'),
('OV25OUGPEA', 'Silver Link.'),
('OX47ZCQHDX', 'Bones'),
('OY28ZDFCTS', 'Sunrise'),
('QR18MYNBJX', 'Madhouse'),
('QS95QKKLED', 'Diomedea'),
('QZ35LFVYYT', 'David Production'),
('RO15MFHQKD', 'J.C.Staff'),
('SQ78ZCRVVR', 'LIDENFILM'),
('SR72GJLYAW', 'CoMix Wave Films'),
('T3SIB24AX66', 'CloverWorks'),
('TD95QIEZZN', 'Studio 3Hz'),
('TR97DRJPNN', 'Doga Kobo'),
('VM38JOYCSP', 'EMT2'),
('VN83CWCZIH', 'Kyoto Animation'),
('WP22NXDCHS', 'Felix Film'),
('YD73IMYLSN', 'Zero-G'),
('YD86XROYGL', 'Craftar Studio'),
('YJ33VLSKTK', 'Pierrot Plus'),
('YQ25KWTGTY', 'Connect'),
('ZG85BRXXLV', 'Project No.9'),
('ZL80LCMSRI', 'Orange'),
('ZM90RZUOMJ', 'ufotable'),
('ZT64QCJTAU', 'Studio Den');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`id_anime`),
  ADD KEY `id_studio` (`id_studio`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id_genres`);

--
-- Indexes for table `genres_on_anime`
--
ALTER TABLE `genres_on_anime`
  ADD KEY `id_anime` (`id_anime`),
  ADD KEY `id_genres` (`id_genres`);

--
-- Indexes for table `myfavorites`
--
ALTER TABLE `myfavorites`
  ADD KEY `username` (`email`),
  ADD KEY `id_anime` (`id_anime`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD KEY `username` (`email`),
  ADD KEY `id_anime` (`id_anime`);

--
-- Indexes for table `studios`
--
ALTER TABLE `studios`
  ADD PRIMARY KEY (`id_studio`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anime`
--
ALTER TABLE `anime`
  ADD CONSTRAINT `anime_ibfk_1` FOREIGN KEY (`id_studio`) REFERENCES `studios` (`id_studio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `genres_on_anime`
--
ALTER TABLE `genres_on_anime`
  ADD CONSTRAINT `genres_on_anime_ibfk_1` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id_anime`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `genres_on_anime_ibfk_2` FOREIGN KEY (`id_genres`) REFERENCES `genres` (`id_genres`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `myfavorites`
--
ALTER TABLE `myfavorites`
  ADD CONSTRAINT `myfavorites_ibfk_2` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id_anime`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `myfavorites_ibfk_3` FOREIGN KEY (`email`) REFERENCES `accounts` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id_anime`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `score_ibfk_3` FOREIGN KEY (`email`) REFERENCES `accounts` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

import { img, avatar } from 'shared/config/images';

export const CATEGORIES = [
  { id: 'texts', name: 'Тексты и переводы', icon: '📝' },
  { id: 'dev', name: 'Разработка', icon: '💻' },
  { id: 'design', name: 'Дизайн', icon: '🎨' },
  { id: 'audio', name: 'Аудио, видео монтаж', icon: '🎬' },
  { id: 'seo', name: 'SEO и оптимизация', icon: '📈' },
  { id: 'business', name: 'Бизнес и жизнь', icon: '💼' },
  { id: 'smm', name: 'Соцсети и реклама', icon: '📱' },
];

export const ACTIVE_WORKS = [
  { id: 1, title: 'Сделать дизайн интернет-магазина', author: 'Никита Евреев', avatar: avatar(12), desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed leo at hendrerit dictum diam, enim.' },
  { id: 2, title: 'Верстка landing page', author: 'Семён Сергеев', avatar: avatar(33), desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed leo at hendrerit dictum diam.' },
  { id: 3, title: 'Сделать дизайн сайта-каталога', author: 'Ангелина Сорокина', avatar: avatar(45), desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed leo at hendrerit dictum diam.' },
  { id: 4, title: 'Продвижение instagram', author: 'Марина Королёва', avatar: avatar(25), desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed leo at hendrerit dictum diam.' },
  { id: 5, title: 'Срочно! Нужен веб дизайнер!', author: 'Никита Евреев', avatar: avatar(12), desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed leo at hendrerit dictum diam.' },
];

export const FREELANCERS = [
  { id: 1, name: 'Марина Королёва', role: 'Разработчик PHP', projects: 65, rating: 4, avatar: avatar(25) },
  { id: 2, name: 'Семён Сергеев', role: 'Копирайтер', projects: 104, rating: 5, avatar: avatar(33) },
  { id: 3, name: 'Ангелина Сорокина', role: 'Дизайнер сайтов', projects: 25, rating: 5, avatar: avatar(45) },
  { id: 4, name: 'Никита Зайцев', role: 'Маркетолог', projects: 144, rating: 4, avatar: avatar(12) },
  { id: 5, name: 'Наталья Захарова', role: 'Motion дизайнер', projects: 71, rating: 5, avatar: avatar(32) },
];

export const EXCHANGE_JOBS = Array(8).fill(null).map((_, i) => ({
  id: i + 1,
  title: 'Нужно сделать Дизайн сайта по тематике авто',
  author: 'Екатерина Иванова',
  avatar: avatar(20),
  postedProjects: 25,
  reviews: 15,
  rating: 4,
  budget: 50000,
  time: '4 часа 28 минут назад',
  offers: 50,
}));

export const PURCHASES = Array(12).fill(null).map((_, i) => ({
  id: i + 1,
  title: 'Дизайн сайта',
  package: 'Стандарт пакет',
  price: 50000,
  date: '26.03.2021',
  status: i % 3 === 0 ? 'Завершено' : 'Выполняется',
  image: img(i + 1),
}));

export const MY_ORDERS = Array(6).fill(null).map((_, i) => ({
  id: i + 1,
  title: 'Нужно сделать Дизайн сайта по тематике авто',
  desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mus volutpat sollicitudin in ligula.',
  budget: 50000,
  time: '4 часа 28 минут назад',
  offers: 50,
  status: i % 4 === 0 ? 'Прием ставок' : i % 4 === 1 ? 'Завершено' : i % 4 === 2 ? 'Закрыт' : 'Завершено',
}));

export const REVIEWS = Array(6).fill(null).map((_, i) => ({
  id: i + 1,
  author: 'Никита Евреев',
  rating: 4,
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus tincidunt eget eu, eget commodo condimentum non.',
}));

export const WALLET_HISTORY = [
  { id: 1, type: 'in', operation: 'Пополнение баланса', date: '22 октября, 2021 года', amount: 150000, hash: 'c2d5abb5bd5d8e9b5d0379b8ef8f70ce9df5a97daf68' },
  { id: 2, type: 'out', operation: 'Вывод средств', date: '15 октября, 2021 года', amount: 300000, hash: '826ad6c3e5757f747304a0cc7a4f4e000f6ffacd832' },
  { id: 3, type: 'buy', operation: 'Покупка услуги', date: '14 сентября, 2021 года', amount: 200000, hash: '987829a3bdfb28cbb8b69d4a4dcdeedce6f3792ac' },
];

export const FAVORITES = Array(12).fill(null).map((_, i) => ({
  id: i + 1,
  title: 'Дизайн сайта',
  price: 50000,
  author: 'Екатерина Иванова',
  avatar: avatar(20),
  projects: 45,
  rating: 4,
  image: img(i + 100),
}));

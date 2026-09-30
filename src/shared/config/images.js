// ============================================================
// ВСЕ КАРТИНКИ ПРОЕКТА — меняешь пути здесь и всё обновляется
// ============================================================
//
// КАК ЗАМЕНИТЬ:
// 1. Положи свою картинку в public/images/имя.png
// 2. Открой этот файл
// 3. Замени значение на '/images/имя.png'
//
// Пример:
//   heroImage: 'https://i.pravatar.cc/300?img=12'
//   → heroImage: '/images/hero.png'
// ============================================================

export const IMAGES = {
  // === ЛОГОТИП ===
  logo: '/logo.svg',                     // public/logo.svg

  // === ГЛАВНАЯ — HERO ===
  heroAvatar: 'https://i.pravatar.cc/300?img=12',   // человек на главной

  // === ГЛАВНАЯ — БЛОК "КАК WORKTAP ПОМОГАЕТ БИЗНЕСУ" ===
  helpsBusiness: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600',

  // === ПРОФИЛЬ (юзер) ===
  userAvatar: 'https://i.pravatar.cc/100?img=12',

  // === КАРТИНКИ ТОВАРОВ (ворки, заказы) ===
  // Используются через `work.img` в mocks.js
  workPlaceholder: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400',

  // === АВАТАРЫ ФРИЛАНСЕРОВ (для карточек) ===
  // Используются в mocks.js FREELANCERS
  freelancerAvatar: (n) => `https://i.pravatar.cc/80?img=${n}`,

  // === AVATAR для отзывов и чата ===
  reviewAvatar: 'https://i.pravatar.cc/60?img=12',
  chatAvatar: 'https://i.pravatar.cc/60?img=12',
};

// Короткие помощники для картинок в моках
export const img = (seed, w = 400) =>
  `https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=${w}&sig=${seed}`;

export const avatar = (n) => `https://i.pravatar.cc/80?img=${n}`;

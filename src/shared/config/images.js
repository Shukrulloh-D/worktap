// ============================================================
// ВСЕ КАРТИНКИ ПРОЕКТА — МЕНЯЙ ТОЛЬКО ЗДЕСЬ
// ============================================================
// Как заменить:
//  1. Положи файл в public/images/имя.png
//  2. Замени строку на '/images/имя.png'
// Пример:
//   heroAvatar: 'https://i.pravatar.cc/300?img=12'
//   → heroAvatar: '/images/hero-man.png'
// ============================================================

export const IMAGES = {
  // === ЛОГОТИП (public/logo.svg) ===
  logo: '/logo.svg',

  // === ГЛАВНАЯ ===
  heroAvatar: '/hero.png',
  helpsBusiness: '/helpBusiness.png',

  // === AUTH (Login/Signup/Reset/NewPassword) ===
  authBg: 'login.png',

  // === ПРОФИЛЬ / ЧАТ / ОТЗЫВЫ ===
  userAvatar: '/userAvatar.png',
  curator: 'https://i.pravatar.cc/80?img=20',
  reviewAvatar: '/reviewAvatar.png',

  // === КАРТИНКИ ТОВАРОВ / ВОРКОВ / ЗАКАЗОВ ===
  workImage1: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400',
  workImage2: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
  workImage3: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400',
};

// Утилиты для моков
export const img = (seed, w = 400) =>
  `https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=${w}&sig=${seed}`;

export const avatar = (n) => `https://i.pravatar.cc/80?img=${n}`;

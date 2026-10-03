
export const IMAGES = {

  logo: '/logo.svg',
  heroAvatar: 'hero.png',
  helpsBusiness: 'helpBusiness.png',
  authBg: '/public/images/ernar.png',

  userAvatar: '/public/images/ernar.png',
  // ↑ ЗАМЕНИ на '/images/ernar.png'

  // 6. АВАТАР ЗАКАЗЧИКА / КУРАТОРА
  //    Где: страница заказа справа, страница конкурса справа
  curator: 'https://i.pravatar.cc/80?img=20',
  reviewAvatar: '/reviewAvatar.png',


  workImage1: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400',
  workImage2: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
  workImage3: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400',
};
export const img = (seed, w = 400) =>
  `https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=${w}&sig=${seed}`;

export const avatar = (n) => `https://i.pravatar.cc/80?img=${n}`;

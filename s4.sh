# ========= ORDER (для фрилансера) =========
cat > src/pages/order-freelancer/order-freelancer.module.css << 'END'
.section { padding: 40px 0; }
.layout { display: grid; grid-template-columns: 1fr 340px; gap: 40px; }
.title { font-size: 24px; font-weight: 800; margin-bottom: 12px; }
.breadcrumbs { font-size: 13px; color: var(--c-gray); margin-bottom: 16px; }
.meta { display: flex; gap: 16px; margin-bottom: 20px; font-size: 13px; }
.meta strong { color: var(--c-primary); font-weight: 700; }
.desc { font-size: 14px; color: var(--c-gray); line-height: 1.7; margin-bottom: 24px; }
.docs { display: flex; flex-direction: column; gap: 10px; margin-bottom: 24px; }
.doc { display: flex; gap: 10px; align-items: center; padding: 12px 16px; background: var(--c-bg); border-radius: var(--r-sm); font-size: 13px; font-weight: 500; }
.submit { padding: 14px 40px; border-radius: var(--r-pill); }
.side { }
.card { background: #fff; border: 1px solid var(--c-border); border-radius: var(--r); padding: 20px; margin-bottom: 16px; }
.author { display: flex; gap: 12px; align-items: center; margin-bottom: 12px; }
.author img { width: 56px; height: 56px; border-radius: 50%; }
.authorName { font-weight: 700; }
.authorRole { font-size: 12px; color: var(--c-gray); }
.proposals { font-size: 13px; color: var(--c-gray); }
.form { display: flex; flex-direction: column; gap: 12px; }
.form label { font-size: 13px; font-weight: 600; display: block; margin-bottom: 6px; }
.form button { padding: 14px; border-radius: var(--r-pill); margin-top: 8px; }
@media (max-width: 900px) { .layout { grid-template-columns: 1fr; } }
END

cat > src/pages/order-freelancer/order-freelancer.jsx << 'END'
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './order-freelancer.module.css';

export const OrderFreelancerPage = () => {
  const toast = useToast();
  const [form, setForm] = useState({ price: '', days: '', qty: '', desc: '' });

  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.breadcrumbs}>Дизайн / Веб и мобильный дизайн / Веб-дизайн</div>
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать Дизайн сайта по тематике авто</h1>
              <div className={styles.meta}>
                <strong>50 000 тенге</strong>
                <span>до 14.07.2021</span>
              </div>
              <p className={styles.desc}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt aliquet felis ullamcorper duis faucibus sapien tincidunt tristique elit. Facilisi feugiat neque morbi quis. Justo non mauris velit amet, habitasse. Enim, euismod purus semper urna.</p>

              <div className={styles.docs}>
                {['Документ 1.png','Документ 2.jpeg','Документ 3.pdf'].map(d => (
                  <div key={d} className={styles.doc}>📄 {d}</div>
                ))}
              </div>

              <button className={`btn btn-primary ${styles.submit}`} onClick={() => toast('Отклик отправлен!')}>Предложить услугу</button>
            </div>

            <aside className={styles.side}>
              <div className={styles.card}>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                    <div className={styles.authorRole}>Размещено проектов на бирже: 25</div>
                  </div>
                </div>
                <div style={{ display: 'flex', gap: 2, marginBottom: 12 }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={14} />)}
                </div>
                <div className={styles.proposals}>15 отзывов</div>
              </div>

              <div className={styles.card}>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>Предложить услугу</h3>
                <div className={styles.form}>
                  <div>
                    <label>Стоимость</label>
                    <input className="input" placeholder="Placeholder" value={form.price} onChange={(e) => setForm({ ...form, price: e.target.value })} />
                  </div>
                  <div>
                    <label>Сроки в днях</label>
                    <input className="input" placeholder="Placeholder" value={form.days} onChange={(e) => setForm({ ...form, days: e.target.value })} />
                  </div>
                  <div>
                    <label>Количество доработок</label>
                    <input className="input" placeholder="Placeholder" value={form.qty} onChange={(e) => setForm({ ...form, qty: e.target.value })} />
                  </div>
                  <div>
                    <label>Описание</label>
                    <textarea className="input" placeholder="Кратко опишите свой ворк" style={{ minHeight: 80 }} value={form.desc} onChange={(e) => setForm({ ...form, desc: e.target.value })} />
                  </div>
                  <button type="button" className="btn btn-primary" onClick={() => toast('Услуга предложена')}>Предложить услугу</button>
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './order-freelancer';" > src/pages/order-freelancer/index.js

# ========= ORDER BID =========
cat > src/pages/order-bid/order-bid.module.css << 'END'
@import '../order-freelancer/order-freelancer.module.css';
END
cat > src/pages/order-bid/order-bid.jsx << 'END'
import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './order-bid.module.css';

export const OrderBidPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать Дизайн сайта по тематике авто</h1>
              <div className={styles.meta}><strong>50 000 тенге</strong><span>до 14.07.2021</span></div>
              <p className={styles.desc}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt aliquet felis ullamcorper duis faucibus sapien tincidunt tristique elit.</p>
              <div className={styles.docs}>
                {['Документ 1.png','Документ 2.jpeg','Документ 3.pdf'].map(d => <div key={d} className={styles.doc}>📄 {d}</div>)}
              </div>
              <button className={`btn btn-primary ${styles.submit}`} onClick={() => toast('Услуга предложена')}>Предложить услугу</button>
            </div>
            <aside className={styles.side}>
              <div className={styles.card}>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                    <div className={styles.authorRole}>Размещено проектов: 25</div>
                  </div>
                </div>
                <div style={{ display: 'flex', gap: 2, marginBottom: 12 }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={14} />)}
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './order-bid';" > src/pages/order-bid/index.js

# ========= ORDER OWNER (для создателя) =========
cat > src/pages/order-owner/order-owner.module.css << 'END'
@import '../order-freelancer/order-freelancer.module.css';
.bid { background: #fff; border: 1px solid var(--c-border); border-radius: var(--r); padding: 20px; margin-bottom: 16px; }
.bidHead { display: flex; justify-content: space-between; margin-bottom: 12px; }
.bidPrice { font-size: 18px; font-weight: 800; color: var(--c-primary); }
.bidDays { font-size: 13px; color: var(--c-gray); text-align: right; }
.bidAuthor { display: flex; gap: 12px; align-items: center; margin-bottom: 12px; }
.bidAuthor img { width: 48px; height: 48px; border-radius: 50%; }
.bidActions { display: flex; gap: 12px; margin-top: 12px; }
.bidBtn { padding: 10px 24px; border-radius: var(--r-pill); font-weight: 600; font-size: 13px; cursor: pointer; border: none; }
.bidAccept { background: var(--c-primary-l); color: var(--c-primary); border: 1px solid var(--c-primary); }
.bidDecline { background: var(--c-bg); color: var(--c-gray); }
END

cat > src/pages/order-owner/order-owner.jsx << 'END'
import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './order-owner.module.css';

export const OrderOwnerPage = () => {
  const toast = useToast();
  const bids = Array(6).fill(null).map((_, i) => ({ id: i + 1, name: 'Никита Евреев', price: '50 000 тг', days: '3 дня' }));
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать Дизайн сайта по тематике авто</h1>
              <div className={styles.meta}><strong>50 000 тенге</strong><span>до 14.07.2021</span></div>
              <p className={styles.desc}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt aliquet felis ullamcorper duis faucibus sapien tincidunt tristique elit.</p>

              <h3 style={{ fontSize: 18, fontWeight: 700, marginTop: 32, marginBottom: 16 }}>Ставки фрилансеров</h3>
              {bids.map(b => (
                <div key={b.id} className={styles.bid}>
                  <div className={styles.bidHead}>
                    <div className={styles.bidPrice}>{b.price}</div>
                    <div className={styles.bidDays}>{b.days}</div>
                  </div>
                  <div className={styles.bidAuthor}>
                    <img src={IMAGES.reviewAvatar} alt="" />
                    <div>
                      <div style={{ fontWeight: 700 }}>{b.name}</div>
                      <div style={{ display: 'flex', gap: 2 }}>
                        {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={12} />)}
                      </div>
                    </div>
                  </div>
                  <div style={{ fontSize: 13, color: 'var(--c-gray)' }}>Количество доработок: 5</div>
                  <div className={styles.bidActions}>
                    <button className={`${styles.bidBtn} ${styles.bidAccept}`} onClick={() => toast('Исполнитель выбран')}>Выбрать</button>
                    <button className={`${styles.bidBtn} ${styles.bidDecline}`} onClick={() => toast('Отклонено')}>Отклонить</button>
                  </div>
                </div>
              ))}
            </div>
            <aside className={styles.side}>
              <div className={styles.card}>
                <button className="btn btn-ghost btn-full" style={{ marginBottom: 12 }}>Изменить</button>
                <button className="btn btn-outline btn-full" style={{ color: 'var(--c-danger)', borderColor: 'var(--c-danger)' }}>Закрыть без выполнения</button>
              </div>
              <div className={styles.card}>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                    <div className={styles.authorRole}>Размещено проектов: 25</div>
                  </div>
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './order-owner';" > src/pages/order-owner/index.js

# ========= CONTEST FREELANCER =========
cat > src/pages/contest-freelancer/contest-freelancer.module.css << 'END'
@import '../work-detail/work-detail.module.css';
.contestField { margin-bottom: 20px; }
.contestField label { font-size: 13px; font-weight: 600; display: block; margin-bottom: 6px; }
.docs { display: flex; flex-direction: column; gap: 10px; margin-bottom: 24px; }
.doc { display: flex; gap: 10px; align-items: center; padding: 12px 16px; background: var(--c-bg); border-radius: var(--r-sm); font-size: 13px; font-weight: 500; }
.submit { padding: 14px 40px; border-radius: var(--r-pill); }
END
cat > src/pages/contest-freelancer/contest-freelancer.jsx << 'END'
import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './contest-freelancer.module.css';

export const ContestFreelancerPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать рекламный баннер</h1>
              <div className={styles.meta}><strong>100 000 тенге</strong><span>до 14.07.2021</span></div>

              {['Название компании / частное лицо: McDonald\'s','Род деятельности компании: Бургеры','Каналы распространения и география продаж: Республика Казахстан, г. Алматы','Портрет целевой аудитории: от 6 до 20 лет','Укажите ближайших конкурентов: BurgerKing, KFC, JekakDoner'].map(f => (
                <div key={f} className={styles.contestField}>
                  <label>{f.split(':')[0]}:</label>
                  <div style={{ fontSize: 14 }}>{f.split(':').slice(1).join(':').trim()}</div>
                </div>
              ))}

              <div className={styles.docs}>
                {['Документ 1.png','Документ 2.jpeg','Документ 3.pdf'].map(d => (
                  <div key={d} className={styles.doc}>📄 {d}</div>
                ))}
              </div>

              <button className={`btn btn-primary ${styles.submit}`} onClick={() => { toast('Вы участвуете в конкурсе'); nav('/contest-take-part'); }}>Участвовать в конкурсе</button>
            </div>

            <aside className={styles.side}>
              <div className={styles.card}>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                    <div className={styles.authorRole}>Размещено проектов: 25</div>
                  </div>
                </div>
                <div style={{ display: 'flex', gap: 2, marginBottom: 12 }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={14} />)}
                </div>
                <div style={{ fontSize: 13, color: 'var(--c-gray)' }}>15 отзывов</div>
                <div className={styles.tags}>
                  {['Дизайн баннера','Реклама','Дизайн соц сетей'].map(t => <span key={t} className={styles.tag}>{t}</span>)}
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './contest-freelancer';" > src/pages/contest-freelancer/index.js

# ========= CONTEST BID =========
cat > src/pages/contest-bid/contest-bid.module.css << 'END'
@import '../contest-freelancer/contest-freelancer.module.css';
END
cat > src/pages/contest-bid/contest-bid.jsx << 'END'
import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './contest-bid.module.css';

export const ContestBidPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать рекламный баннер</h1>
              <div className={styles.meta}><strong>100 000 тенге</strong><span>до 14.07.2021</span></div>
              <p className={styles.desc}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt aliquet felis ullamcorper duis faucibus sapien tincidunt tristique elit.</p>
              <div className={styles.docs}>
                {['Документ 1.png','Документ 2.jpeg','Документ 3.pdf'].map(d => <div key={d} className={styles.doc}>📄 {d}</div>)}
              </div>
              <h3 style={{ fontSize: 18, fontWeight: 700, marginTop: 32, marginBottom: 16 }}>Принять участие</h3>
              <div className={styles.contestField}>
                <label>Описание</label>
                <textarea className="input" placeholder="Кратко опишите свой ворк" style={{ minHeight: 120 }} />
              </div>
              <div className={styles.contestField}>
                <label>Фотографии для конкурса</label>
                <div style={{ fontSize: 12, color: 'var(--c-gray)', marginBottom: 8 }}>Загрузите фотографии работ, которые Вы сделали для конкурса.</div>
                <div style={{ display: 'flex', gap: 12 }}>
                  <div style={{ width: 100, height: 100, background: '#F5F0FF', borderRadius: 8, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', cursor: 'pointer' }}>
                    <div style={{ fontSize: 24, color: 'var(--c-peach)' }}>+</div>
                    <div style={{ fontSize: 11, color: 'var(--c-peach)' }}>Добавить фото</div>
                  </div>
                  <img src={IMAGES.workImage1} alt="" style={{ width: 100, height: 100, borderRadius: 8, objectFit: 'cover' }} />
                  <img src={IMAGES.workImage2} alt="" style={{ width: 100, height: 100, borderRadius: 8, objectFit: 'cover' }} />
                </div>
              </div>
              <button className={`btn btn-primary ${styles.submit}`} onClick={() => toast('Работа отправлена!')}>Отправить работу</button>
            </div>
            <aside className={styles.side}>
              <div className={styles.card}>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                  </div>
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './contest-bid';" > src/pages/contest-bid/index.js

# ========= CONTEST TAKE PART =========
cat > src/pages/contest-take-part/contest-take-part.module.css << 'END'
@import '../contest-bid/contest-bid.module.css';
END
cat > src/pages/contest-take-part/contest-take-part.jsx << 'END'
import { IMAGES } from 'shared/config/images';
import { useToast } from 'shared/lib/toast';
import styles from './contest-take-part.module.css';

export const ContestTakePartPage = () => {
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container" style={{ maxWidth: 700 }}>
          <h1 className={styles.title}>Принять участие</h1>
          <div className={styles.contestField}>
            <label>Описание</label>
            <textarea className="input" placeholder="Кратко опишите свой ворк" style={{ minHeight: 120 }} />
          </div>
          <div className={styles.contestField}>
            <label>Фотографии для конкурса</label>
            <div style={{ fontSize: 12, color: 'var(--c-gray)', marginBottom: 8 }}>Загрузите фотографии работ, которые Вы сделали для конкурса.</div>
            <div style={{ display: 'flex', gap: 12 }}>
              <div style={{ width: 100, height: 100, background: '#F5F0FF', borderRadius: 8, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', cursor: 'pointer' }}>
                <div style={{ fontSize: 24, color: 'var(--c-peach)' }}>+</div>
                <div style={{ fontSize: 11, color: 'var(--c-peach)' }}>Добавить фото</div>
              </div>
              <img src={IMAGES.workImage1} alt="" style={{ width: 100, height: 100, borderRadius: 8, objectFit: 'cover' }} />
              <img src={IMAGES.workImage2} alt="" style={{ width: 100, height: 100, borderRadius: 8, objectFit: 'cover' }} />
            </div>
          </div>
          <button className={`btn btn-primary ${styles.submit}`} onClick={() => toast('Работа отправлена!')}>Отправить работу</button>
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './contest-take-part';" > src/pages/contest-take-part/index.js

# ========= CONTEST OWNER =========
cat > src/pages/contest-owner/contest-owner.module.css << 'END'
@import '../contest-freelancer/contest-freelancer.module.css';
.participant { background: #fff; border: 1px solid var(--c-border); border-radius: var(--r); padding: 20px; margin-bottom: 16px; }
.pHead { display: flex; gap: 12px; align-items: center; margin-bottom: 12px; }
.pHead img { width: 48px; height: 48px; border-radius: 50%; background: #E5E5E5; }
.workImages { display: flex; gap: 12px; margin: 12px 0; }
.workImages img { width: 100px; height: 80px; border-radius: 8px; objectFit: cover; }
.actions { display: flex; gap: 12px; }
.accept { padding: 10px 24px; border: 1px solid var(--c-primary); color: var(--c-primary); border-radius: var(--r-pill); font-weight: 600; font-size: 13px; background: transparent; cursor: pointer; }
.accept:hover { background: var(--c-primary); color: #fff; }
.decline { padding: 10px 24px; border: 1px solid var(--c-border); color: var(--c-gray); border-radius: var(--r-pill); font-weight: 600; font-size: 13px; background: #fff; cursor: pointer; }
.decline:hover { border-color: var(--c-danger); color: var(--c-danger); }
END

cat > src/pages/contest-owner/contest-owner.jsx << 'END'
import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './contest-owner.module.css';

export const ContestOwnerPage = () => {
  const toast = useToast();
  const participants = Array(5).fill(null).map((_, i) => ({ id: i + 1, name: 'Никита Евреев' }));
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать рекламный баннер</h1>
              <div className={styles.meta}><strong>100 000 тенге</strong><span>до 14.07.2021</span></div>
              <p className={styles.desc}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt aliquet felis.</p>

              <h3 style={{ fontSize: 18, fontWeight: 700, marginTop: 32, marginBottom: 16 }}>Работы участников</h3>
              {participants.map(p => (
                <div key={p.id} className={styles.participant}>
                  <div className={styles.pHead}>
                    <div style={{ width: 48, height: 48, borderRadius: '50%', background: '#E5E5E5' }} />
                    <div style={{ fontWeight: 700 }}>{p.name}</div>
                  </div>
                  <div style={{ display: 'flex', gap: 2, marginBottom: 8 }}>
                    {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={14} />)}
                  </div>
                  <p style={{ fontSize: 13, color: 'var(--c-gray)', marginBottom: 12, lineHeight: 1.6 }}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus tincidunt eget eu, eget commodo condimentum non, fringilla fermentum.</p>
                  <div className={styles.workImages}>
                    <img src={IMAGES.workImage1} alt="" />
                    <img src={IMAGES.workImage2} alt="" />
                    <img src={IMAGES.workImage3} alt="" />
                  </div>
                  <div className={styles.actions}>
                    <button className={styles.accept} onClick={() => toast('Победитель выбран!')}>Выбрать</button>
                    <button className={styles.decline} onClick={() => toast('Отклонено')}>Отклонить</button>
                  </div>
                </div>
              ))}
            </div>
            <aside className={styles.side}>
              <div className={styles.card}>
                <button className="btn btn-ghost btn-full">Изменить</button>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './contest-owner';" > src/pages/contest-owner/index.js

# ========= ОБНОВЛЯЕМ IMAGES =========
cat > src/shared/config/images.js << 'END'
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
  heroAvatar: 'https://i.pravatar.cc/300?img=12',
  helpsBusiness: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600',

  // === AUTH (Login/Signup/Reset/NewPassword) ===
  authBg: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=900',

  // === ПРОФИЛЬ / ЧАТ / ОТЗЫВЫ ===
  userAvatar: 'https://i.pravatar.cc/100?img=12',
  curator: 'https://i.pravatar.cc/80?img=20',
  reviewAvatar: 'https://i.pravatar.cc/60?img=12',

  // === КАРТИНКИ ТОВАРОВ / ВОРКОВ / ЗАКАЗОВ ===
  workImage1: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400',
  workImage2: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
  workImage3: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400',
};

// Утилиты для моков
export const img = (seed, w = 400) =>
  `https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=${w}&sig=${seed}`;

export const avatar = (n) => `https://i.pravatar.cc/80?img=${n}`;
END

echo ""
echo "PART 2 DONE"
